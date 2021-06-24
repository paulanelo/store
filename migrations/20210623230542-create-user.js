'use strict';
module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.createTable('users', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      email: {
        type: Sequelize.STRING(150)
      },
      name: {
        type: Sequelize.STRING(50)
      },
      lastName: {
        type: Sequelize.STRING(50)
      },
      password: {
        type: Sequelize.STRING(250)
      },
      role: {
        type: Sequelize.ENUM('ADMIN', 'USER')
      }
    });
  },
  down: async (queryInterface, Sequelize) => {
    await queryInterface.dropTable('users');
  }
};