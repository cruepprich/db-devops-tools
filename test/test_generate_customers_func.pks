create or replace package test_generate_customers_func as

  -- %suite(Generate Customers function)
  -- %suitepath(generate_customers)
  -- %rollback(manual)

  -- %beforeall
  procedure delete_added_customers
  -- %test(Generates all requested)
  procedure gen_all;
end test_generate_customers_func;
/
