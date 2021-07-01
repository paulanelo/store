'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Produto extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      this.belongsTo(models.users, {
        foreignKey: 'users_id',
        as: 'user'
      })
    }
  };
  Produto.init({
    id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      autoIncrement: true,
      primaryKey: true,
    },
    name: DataTypes.STRING(150),
    price: DataTypes.DECIMAL(10),
    description: DataTypes.STRING(240),
    active: DataTypes.INTEGER(1),
    users_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      foreignKey: true
    }
  }, {
    sequelize,
    modelName: 'Produto',
    tableName: 'products',
    timestamps: false
  });
  return Produto;
};