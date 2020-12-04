create or replace package test_generate_customers_func as

  -- %suite(Generate Customers function)
  -- %suitepath(generate_customers)
  -- %rollback(manual)

  -- %beforeall
  procedure delete_added_customers;
  -- %test(Generates all requested)
  procedure gen_all;

  procedure gen_to_limit is
  begin
    ut.expect( generate_customers( 3 ) ).to_( equal(23) );
  end;

end test_generate_customers_func;
/
