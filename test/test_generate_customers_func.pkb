create or replace package body test_generate_customers_func as
  --comment

  procedure delete_added_customers is
  begin
    delete from customers
    where email like 'custxxx%';
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
    FOR counter IN 1 .. 30 LOOP
        new_name := 'custxxxTestOL' || counter || ' ' || CURRENT_TIMESTAMP;
        INSERT INTO customers (
        name,
        email
        ) VALUES (
        new_name,
        translate(new_name, ' ', '.') ||'@example.com'
        );
    END LOOP;
    ut.expect( generate_customers( 30 ) ).to_( equal(0) );
  end;

  procedure null_amount is
  begin
    ut.expect( generate_customers( null ) ).to_( equal(0) );
  end;

  procedure alpha_in is
    created integer;
  begin
    created := generate_customers( 'x' );
  end;


  -- new function pvt_test
  -- new function pvt_test
  -- new function pvt_test
  function pvt_test(p_number in number) is
  return number;
  begin
    return p_number*10;
  end;



end test_generate_customers_func;
/
