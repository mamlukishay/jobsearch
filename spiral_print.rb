def spiral_print(arr)
   dirs = [[0,1], [1,0], [0,-1], [-1,0]].cycle
   row, col = 0, 0 
   width, height = arr.size, arr[0].size
   unvisited = width * height
   
   while unvisited > 0 
      dir = dirs.next
      
      while arr[row][col] 
         puts arr[row][col]
         unvisited -= 1
         row += dir[0]
         col += dir[1]  # dir = [1,0] dir[0] == 1 M[row][col]==M[0][0]--M[0][1] M[0][2]...
      end
      
      x -= dir_x
      y -= dir_y
   end
end


Pseudo code:
function spiralMatrixPrint(M):
   topRow = 0
   btmRow = m-1
   leftCol = 0
   rightCol = n-1
 
   while (topRow <= btmRow AND leftCol <= rightCol):
      # print the next top row
      for i from leftCol to rightCol:
         print M[topRow][i]
      topRow++

      # print the next right hand side column
      for i from topRow to btmRow:
         print M[i][rightCol]
      rightCol--

      # print the next bottom row
      if (topRow <= btmRow):
         for i from rightCol to leftCol:
            print M[btmRow][i]
         btmRow--

      # print the next left hand side column
      if (leftCol <= rightCol):
         for i from btmRow to topRow:
            print M[i][leftCol]
         leftCol++