Then /^I should see the following categories:$/ do |table|
  table.hashes.each do |category|
    category.each do |key, value|
      step %{I should see "#{value}"}
    end
  end
end

