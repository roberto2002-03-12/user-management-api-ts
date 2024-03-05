import { Request, Response, NextFunction } from 'express';
import createHttpError from 'http-errors';
import { CreateRole, IRoleQuery, IUserRole, UpdateRole } from '../model';
import { 
  createRoleService, getAllRolesService,
  assignRoleToUserService, desactivateOrActivateRoleService,
  getOneRoleService, updateAssignMassiveActionToRoleService
} from '../services';
import { IPayloadUser, OrderType } from '../../../shared/models';

export const createRoleController = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const user = req.user as IPayloadUser;
    const role: CreateRole = req.body;
    const result = await createRoleService(role, user.sub);
    return res.status(201).json(result);
  } catch (error: any) {
    next(createHttpError(500, error));
  }
}

export const assignRoleToUserController = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const user = req.user as IPayloadUser;
    const assignment: IUserRole = req.body;
    const result = await assignRoleToUserService(assignment, user.sub);
    return res.status(201).json(result);
  } catch (error: any) {
    next(createHttpError(500, error));
  }
}

export const getAllRolesController = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { roleName, active, order, createdAtStart, routeId, createdAtEnd, page, limit } = req.query;
    const queries: IRoleQuery = {
      order: order as OrderType,
      roleName: roleName?.toString() ?? '',
      routeId: typeof routeId === 'undefined' ? undefined : parseInt(routeId as string),
      active: active === 'true' ? true : active === 'false' ? false : true,
      createdAtStart: createdAtStart?.toString(),
      createdAtEnd: createdAtEnd?.toString(),
      page: parseInt((page as string) ?? '1'),
      limit: typeof limit === 'undefined' ? undefined : parseInt(limit as string)
    }
    const result = await getAllRolesService(queries);
    return res.status(200).json(result);
  } catch (error: any) {
    next(createHttpError(500, error));
  }
}

export const getOneRoleController = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const routeId: number = parseInt(req.params.id);
    const result = await getOneRoleService(routeId);
    return res.status(200).json(result);
  } catch (error: any) {
    next(createHttpError(500, error));
  }
}

export const desactivateOrActivateRoleController = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const user = req.user as IPayloadUser;
    const roleId: number = parseInt(req.params.id);
    const result = await desactivateOrActivateRoleService(roleId, user.sub);
    return res.status(201).json(result);
  } catch (error: any) {
    next(createHttpError(500, error));
  }
}

export const updateAssignMassiveActionToRoleController = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const user = req.user as IPayloadUser;
    const roleId: number = parseInt(req.params.id);
    const data: UpdateRole = req.body;
    const result = await updateAssignMassiveActionToRoleService(data, roleId, user.sub);
    return res.status(201).json(result);
  } catch (error: any) {
    next(createHttpError(500, error));
  }
}