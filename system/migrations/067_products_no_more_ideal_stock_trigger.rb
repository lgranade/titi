Sequel.migration do
  up do
    run 'DROP TRIGGER p_name_init_and_ideal_stock'
    run '
      CREATE TRIGGER p_name_init BEFORE UPDATE ON `products`
      FOR EACH ROW SET
      NEW.p_name = replace(replace(replace(concat(NEW.p_short_name," ",NEW.br_name," ",NEW.packaging," ",NEW.size," ",NEW.color," ",NEW.public_sku),"  "," "),"  "," "),"  "," ")
    '
  end

  down do
  end
end



