import { DataBase } from "../../../../database";
import { CreateRole, CreateUserRole } from '../../model';
import config from '../../../../config';
import moment from 'moment-timezone';

export const createRoleService = async (data: CreateRole, userId: number) => {
  try {
    const dateNow = moment().tz(config.TIME_ZONE);
    const dateNowFormat = dateNow.format('YYYY-MM-DDTHH:mm:ss.SSS[Z]');

    return await DataBase.instance.role.create({
      ...data,
      created_by: userId,
      created_at: new Date(dateNowFormat),
      updated_by: userId,
      updated_at: new Date(dateNowFormat)
    });
  } catch (error) {
    throw error;
  }
};

export const assignRoleToUserService = async (data: CreateUserRole, userId: number) => {
  try {
    const dateNow = moment().tz(config.TIME_ZONE);
    const dateNowFormat = dateNow.format('YYYY-MM-DDTHH:mm:ss.SSS[Z]');

    return await DataBase.instance.userRole.create({
      ...data,
      created_by: userId,
      created_at: new Date(dateNowFormat),
      updated_by: userId,
      updated_at: new Date(dateNowFormat)
    });
  } catch (error: any) {
    throw error;
  }
}

