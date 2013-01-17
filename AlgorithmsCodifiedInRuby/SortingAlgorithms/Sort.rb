class Sort
  @valuesArray=Array.new;
  @numberOfValues=-1;
  
  
  def initialize(values)
    @valuesArray=values;
    @numberOfValues=@valuesArray.length;
    
    puts "Original array :#{@valuesArray}";
  end
  
  
  
  def QuickSort(partitionStartIndex=1, partitionEndIndex=@numberOfValues)
    #puts "Partition : #{partitionStartIndex} to #{partitionEndIndex}";
    if partitionStartIndex<partitionEndIndex
      subPartitionIndex=Partition(partitionStartIndex, partitionEndIndex);
      
      QuickSort(partitionStartIndex, subPartitionIndex-1);
      QuickSort(subPartitionIndex+1, partitionEndIndex);
    end
  end
  
  def Partition(partitionStartIndex, partitionEndIndex)
    
    i=partitionStartIndex-1;
    pivotValue=@valuesArray[partitionEndIndex-1];
    
    
    for j in partitionStartIndex..partitionEndIndex-1
      if (@valuesArray[j-1] <= pivotValue)
        i=i+1;
              
        temp=@valuesArray[i-1];
        @valuesArray[i-1]=@valuesArray[j-1];
        @valuesArray[j-1]=temp;
      end
    end
    
    #place pivot value in its correct position
    @valuesArray[partitionEndIndex-1]=@valuesArray[(i+1)-1];
    @valuesArray[(i+1)-1]=pivotValue;
    
    return i+1;
  end
  
  
  def CountingSort(k)
    countArray=Array.new(k);
    sortedArray=Array.new(@numberOfValues);
    
    for index in 0..k-1
      countArray[index]=0;
    end
    
    for index in 0..@numberOfValues-1
      countArray[@valuesArray[index]-1]=countArray[@valuesArray[index]-1]+1;
    end
    
    for number in 1..k-1
      countArray[number]=countArray[number]+countArray[number-1];
    end
    
    index=@numberOfValues-1;
    while(index>=0)
      sortedArray[countArray[@valuesArray[index]-1]-1]=@valuesArray[index]; 
      countArray[@valuesArray[index]-1]=countArray[@valuesArray[index]-1]-1;
      index-=1;
    end
    
    @valuesArray=sortedArray;
  end
  
  def DisplayArray()
    puts "#{@valuesArray}";
  end
end

sortObject=Sort.new([10,1,3,4,3,14,1,9,2,6,11,8]);
#sortObject.QuickSort();
sortObject.CountingSort(14);
sortObject.DisplayArray();