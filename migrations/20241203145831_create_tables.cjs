exports.up = function (knex) {
  return knex.schema
    .createTable('users', (table) => {
      table.increments('id').primary(); // Tạo cột id tự tăng
      table.string('name').notNullable(); // Tạo cột name kiểu string
      table.string('email').notNullable().unique(); // Tạo cột email duy nhất
      table.boolean('is_active').defaultTo(true); // Tạo cột boolean
      table.timestamp('created_at').defaultTo(knex.fn.now()); // Tạo cột thời gian tạo
      table.json('preferences'); // Tạo cột json
    })
};

exports.down = function (knex) {
  return knex.schema
    .dropTableIfExists('users');
};