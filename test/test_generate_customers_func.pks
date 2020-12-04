create or replace package test_generate_customers_func as

  -- %suite(Generate Customers function)
  -- %suitepath(generate_customers)
  -- %rollback(manual)

  -- %beforeall
  -- %beforeeach
  procedure delete_added_customers;
  -- %test(Generates all requested)
  procedure gen_all;

  procedure gen_to_limit;

end test_generate_customers_func;
/
