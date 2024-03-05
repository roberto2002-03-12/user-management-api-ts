import Joi from 'joi';

const firstName = Joi.string().max(45);
const lastName = Joi.string().max(45);
const birth = Joi.date();
const phoneNumber = Joi.number();

export const updateProfileSchema = Joi.object({
  firstName: firstName.optional(),
  lastName: lastName.optional(),
  birth: birth.optional(),
  phoneNumber: phoneNumber.optional()
});