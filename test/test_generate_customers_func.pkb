create or replace package body test_generate_customers_func as

  procedure gen_all is
  begin
    ut.expect( generate_customers( 20 ) ).to_( equal(20) );
  end;
end test_generate_customers_func;
/
