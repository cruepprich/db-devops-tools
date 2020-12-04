create or replace package body test_generate_customers_func as

  procedure delete_added_customers is
  begin
    delete from customers;
    --where name like 'custxxx%';

    commit;
  end;

  procedure gen_all is
  declare
    l_cnt number;
  begin
    select count(*) into l_cnt from customers;
    dbms_output.put_line('Customers count '||l_cnt);
    ut.expect( generate_customers( 20 ) ).to_( equal(20) );
  end;

  procedure gen_to_limit is
  declare
    l_cnt number;
  begin
    select count(*) into l_cnt from customers;
    ut.expect( generate_customers( 3 ) ).to_( equal(23) );
  end;

end test_generate_customers_func;
/
