" List Gymnastics.
" Do not concatenate lists with strings.

let wrestlers = ['Benoit', 'Jericho', 'Rock', 'Eddie']
echo "Original list:"
echo wrestlers

" add to a predefined list
call add(wrestlers, 'Saturn')
echo "add(wrestlers, 'Saturn'):"
echo wrestlers

" remove from a predefined list
" argument must be index, not element
call remove(wrestlers, 2)
echo "remove(wrestlers, 2): "
echo wrestlers

" insert at a given position into list
call insert(wrestlers, 'Malenko', 1)
echo "insert(wrestlers, 'Malenko', 1): "
echo wrestlers

" sort modifies the actual list
" call it on a copy to leave the original unchanged
echo "Sorted:"
echo sort(copy(wrestlers))

echo "Original:"
echo wrestlers

