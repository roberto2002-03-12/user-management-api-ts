import { DataBase } from '../../../database';
import createHttpError from 'http-errors';
import { UpdateProfile } from '../model';

export const updateProfileService = async (data: UpdateProfile, userId: number) => {
  try {
    const profile = await DataBase.instance.profile.findOne({
      where: {
        userId
      }
    });
  
    if (!profile) throw createHttpError(404, `Profile doesn't exist`);
  
    await profile.update(data);

    return { message: 'profile successfully updated' };
  } catch (error) {
    throw error;
  }
}