import { DataBase } from '../../../../database';
import { Transaction } from 'sequelize';
import createHttpError from 'http-errors';
import bcrypt from 'bcrypt';
import { CreateUser, IUserResult } from '../../model';
import { CreateProfile } from '../../../profile/model';
import config from '../../../../config';
import moment from 'moment-timezone';

export const createUserAndProfileService = async (obj: { user: CreateUser, profile: CreateProfile }, userId?: number, roleId?: number) => {
  let transaction: Transaction = await DataBase.instance.sequelize.transaction();

  try {
    const user = await DataBase.instance.user.findOne({ where: { email: obj.user.email } });

    if (user) throw createHttpError(400, 'The user alredy exist');

    const password = await bcrypt.hash(obj.user.password!, 10);

    const dateNow = moment().tz(config.TIME_ZONE);
    const dateNowFormat = dateNow.format('YYYY-MM-DDTHH:mm:ss.SSS[Z]');

    const finalUser: CreateUser = {
      email: obj.user.email,
      password,
      active: true,
      created_by: userId ?? 1000000,
      created_at: new Date(dateNowFormat),
      updated_by: userId ?? 1000000,
      updated_at: new Date(dateNowFormat),
    }

    const resultUser = await DataBase.instance.user.create(finalUser, { transaction });

    const finalProfile: CreateProfile = {
      ...obj.profile,
      created_by: userId ?? 1000000,
      created_at: dateNowFormat,
      updated_by: userId ?? 1000000,
      updated_at: dateNowFormat,
      userId: resultUser.dataValues.id
    }

    const resultProfile = await DataBase.instance.profile.create(finalProfile, { transaction });

    if (roleId && roleId) {
      await DataBase.instance.userRole.create({
        user_id: resultUser.dataValues.id,
        role_id: roleId,
        created_by: userId ?? 1000000,
        created_at: new Date(dateNowFormat),
        updated_by: userId ?? 1000000,
        updated_at: new Date(dateNowFormat),
      }, { transaction });
    };

    const userToJson: IUserResult = resultUser.toJSON();

    delete userToJson.password;

    await transaction.commit();
    
    return {
      user: userToJson,
      profile: resultProfile
    };
  } catch (error: any) {
    if (transaction) await transaction.rollback();
    throw error;
  }
}