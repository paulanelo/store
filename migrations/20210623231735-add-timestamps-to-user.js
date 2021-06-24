'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    /**
     * Add altering commands here.
     *
     * Example:
     * await queryInterface.createTable('users', { id: Sequelize.INTEGER });
     * addColumn(table: string, key: string, attribute: Object, options: Object): Promise
     */
    queryInterface.addColumn('users', 'createdAt', Sequelize.DATE, {
      after: 'role'
    }); 
    queryInterface.addColumn('users', 'updatedAt', Sequelize.DATE, {
      after: 'createdAt'
    }); 
  },

  down: async (queryInterface, Sequelize) => {
    /**
     * Add reverting commands here.
     *
     * Example:
     * await queryInterface.dropTable('users');
     */
    queryInterface.removeColumn('users', 'createdAt');
    queryInterface.removeColumn('users', 'updatedAt');
  }
};
