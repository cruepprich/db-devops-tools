create or replace package body test_generate_customers_func as

  procedure delete_added_customers is
  begin
    delete from customers;
    where email like 'custxxx%'
    commit;
  end;

  procedure gen_all is
  begin
    ut.expect( generate_customers( 20 ) ).to_( equal(20) );
  end;

  procedure gen_to_limit is
  begin
    ut.expect( generate_customers( 3 ) ).to_( equal(23) );
  end;

  procedure over_limit is
    new_name varchar2(200);
  begin
    ut.expect( generate_customers( 30 ) ).to_( equal(0) );
  end;
end test_generate_customers_func;
/
