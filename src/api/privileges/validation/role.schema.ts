import Joi, { boolean } from 'joi';

const id = Joi.number().min(1);

// create role
const roleName = Joi.string().max(45);
const description = Joi.string().max(250);

// queries
const active = Joi.boolean();
const order = Joi.string().valid('ASC', 'DESC');
const createdAtStart = Joi.date();
const createdAtEnd = Joi.date();
const limit = Joi.number().max(100).min(1);
const page = Joi.number().min(1);

const actionSchema = Joi.object({
  id: id.required(),
  actionName: Joi.string().max(45).optional(),
  role_action: Joi.object().optional()
});

export const createRoleSchema = Joi.object({
  roleName: roleName.required(),
  description: description.optional(),
  action: Joi.array().items(actionSchema).optional()
});

const roleSchemaForAssign = Joi.object({
  id: id.required(),
  roleName: roleName.optional()
});

export const assignRoleToUserSchema = Joi.object({
  userId: id.required(),
  roles: Joi.array().items(roleSchemaForAssign).optional()
});

export const includeActionsOnSelectSchema = Joi.object({
  includeActions: Joi.string().valid('true').optional()
});

export const getAllRolesSchema = Joi.object({
  order: order.optional(),
  roleName: roleName.optional(),
  active: active.optional(),
  routeId: id.optional(),
  createdAtStart: createdAtStart.optional(),
  createdAtEnd: createdAtEnd.optional(),
  limit: limit.optional(),
  page: page.required()
});

export const getByIdSchema = Joi.object({
  id: id.required()
});

export const updateAssignMassiveActionToRoleSchema = Joi.object({
  roleName: roleName.optional(),
  description: description.optional(),
  action: Joi.array().items(actionSchema).optional()
});

