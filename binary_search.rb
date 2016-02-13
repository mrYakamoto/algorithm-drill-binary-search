def binary_search_include?(item, sorted_array)
  i = 0
  while i <= sorted_array.length - 1
    if item == sorted_array[i]
      return true
    else
      i += 1
    end
  end
  return false
end

# INITIAL
def binary_search(object, sorted_array)
  middle_index = (sorted_array.length / 2)
  until sorted_array[middle_index] == object
    current_search_object = sorted_array[middle_index]
    if middle_index == 0
      return nil
    elsif sorted_array[middle_index] == sorted_array[-2]
      return nil
    elsif object > current_search_object
      middle_index = ((sorted_array.length-1) + middle_index) / 2
    elsif object < current_search_object
      middle_index = middle_index / 2
    end
  end
  return middle_index
end





