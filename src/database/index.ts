import { Sequelize } from 'sequelize';
import config from '../config';
import { UserStatic, UserFactory } from '../api/auth/model';
import {  
  RouteStatic, RouteFactory,
  RoleStatic, RoleFactory,
  ActionStatic, ActionFactory,

  // relation tables
  UserRoleStatic, UserRoleFactory,
  RoleActionStatic, RoleActionFactory
} from '../api/privileges/model';
import { ProfileStatic, ProfileFactory } from '../api/profile/model/profile.model';

import { CatStatic, CatFactory } from '../api/cats/model';

// relations
import {
  userHasOneProfile, userManyToManyRole,
  routeOneToManyAction, roleManyToManyAction
} from './associations';

export class DataBase {
  private static _instance: DataBase;
  public sequelize: Sequelize;
  private _config = config;
  public user: UserStatic;
  public profile: ProfileStatic;
  public route: RouteStatic;
  public role: RoleStatic;
  public action: ActionStatic;
  public cat: CatStatic;
  
  // relation tables
  public userRole: UserRoleStatic;
  public roleAction: RoleActionStatic;

  constructor () {
    this.sequelize = new Sequelize(
      this._config.DB_NAME,
      this._config.DB_USER,
      this._config.DB_PASS,
      {
        host: this._config.DB_HOST,
        port: Number(this._config.DB_PORT),
        logging: false,
        dialect: 'mysql',
        pool: {
          max: 5,
          min: 0,
          idle: 10000
        }
      }
    )

    this.user = UserFactory(this.sequelize);
    this.profile = ProfileFactory(this.sequelize);
    this.route = RouteFactory(this.sequelize);
    this.role = RoleFactory(this.sequelize);
    this.action = ActionFactory(this.sequelize);
    this.cat = CatFactory(this.sequelize);
    
    // relation tables

    this.userRole = UserRoleFactory(this.sequelize);
    this.roleAction = RoleActionFactory(this.sequelize);

    this.associations();
    this.connectDB();
  }

  public static get instance(): DataBase {
    return this._instance || (this._instance = new this())
  }

  private connectDB(): void {
    this.sequelize.authenticate()
    .then(() => {
      console.log('Database is running')
    })
    .catch((err) => console.error(err));
  }

  private associations(): void {
    userHasOneProfile({
      user: this.user,
      profile: this.profile
    });

    userManyToManyRole({
      user: this.user,
      role: this.role
    });

    roleManyToManyAction({
      role: this.role,
      action: this.action
    });

    routeOneToManyAction({
      route: this.route,
      action: this.action
    });
  }
}