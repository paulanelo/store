'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class User extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  };
  User.init({
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      autoIncrement: true
    },
    email: DataTypes.STRING(150),
    name: DataTypes.STRING(45),
    lastName: DataTypes.STRING(45),
    password: DataTypes.STRING(45),
    role: DataTypes.ENUM("ADMIN", "USER")
  }, {
    sequelize,
    modelName: 'users',
    timestamps: false
  });
  return User;
};