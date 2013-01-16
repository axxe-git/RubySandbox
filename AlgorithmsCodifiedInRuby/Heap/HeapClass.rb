#require 'Float';
class HeapClass
  
  @array=Array.new;
  @arrayLength=-1;
  @heapSize=-1;
  
  def initialize(inputArray, inputArrayLength, inputHeapSize)
    @arrayLength=inputArrayLength;
    @heapSize=inputHeapSize;
    
    @array=inputArray;
    
    #@array[0]=1000;
    
  end
  
  def MaxHeapify(i)
    leftChildIndex=2*i;
    rightChildIndex=(2*i)+1;
    
    largest=i;
    if((leftChildIndex <= @heapSize) and (@array.at(leftChildIndex-1) > @array.at(largest-1)))
        largest=leftChildIndex;
    end
    
    if((rightChildIndex <= @heapSize) and (@array.at(rightChildIndex-1) > @array.at(largest-1)))
      largest=rightChildIndex;
    end
    
    if(largest != i)
      temp=@array.at(i-1);
      @array[i-1]=@array[largest-1];
      @array[largest-1]=temp;     
      
      MaxHeapify(largest);
    end 
  end
  
  def BuildMaxHeap()
    node=(@heapSize/2).floor;
    while node>=1
      MaxHeapify(node);
      node=node-1;
    end
  end
  
  def HeapSort()
    BuildMaxHeap();
    
    while @heapSize>=2
      
      temp = @array[0];
      @array[0]=@array[@heapSize-1];
      @array[@heapSize-1]=temp;
      
      @heapSize = @heapSize-1;
      
      MaxHeapify(1);
    end
  end
  
  def displayArray()
    puts "#{@array}";
  end
end

heapObject=HeapClass.new([10,30,10,50,6,9,1,20],8,8);
heapObject.HeapSort();
heapObject.displayArray();