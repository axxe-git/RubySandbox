class Node    
    attr_accessor :value, :parentNode, :leftChild, :rightChild;
    
    def initialize(val,parent,lChild,rChild)
      @value=val;
      @parentNode=parent;
      @leftChild=lChild;
      @rightChild=rChild;
    end
    
    def DisplayNode()
      puts "Node <@value, @parentNode, @leftChild, @rightChild>";
    end
 end
  
class BinaryTree
#  @numberOfNodes=1;
#  @depth=0;
#  @root=Node.new("","","","");
  
  def initialize()
    @numberOfNodes=0;
    @depth=0;
    @root=Node.new("","","","");
  end
  
  def AddNode(val, depth=@depth, currentNode=@root)
    if Math.log2(@numberOfNodes).modulo(1)==0
      depth=depth-1;
    end
    if (currentNode.value == "")
      @root=Node.new(val,"","","");
      
      @numberOfNodes=@numberOfNodes+1;
      @depth=Math.log2(@numberOfNodes).floor;
      puts "inserted at root : #{@root.value}";
      puts "Node count=#{@numberOfNodes}, depth of tree=#{@depth}";
      puts "";
      return true;
    elsif depth<=0
      if currentNode.leftChild==""
        currentNode.leftChild=Node.new(val,currentNode,"","");
        @numberOfNodes=@numberOfNodes+1;
        @depth=Math.log2(@numberOfNodes).floor;
        puts "inserted as left child of <#{currentNode.value}> : #{currentNode.leftChild.value}";
        puts "Node count=#{@numberOfNodes}, depth of tree=#{@depth}";
        puts "";
        return true;
      elsif currentNode.rightChild==""
        currentNode.rightChild=Node.new(val,currentNode,"","");
        @numberOfNodes=@numberOfNodes+1;
        @depth=Math.log2(@numberOfNodes).floor;
        puts "inserted as right child of <#{currentNode.value}> : #{currentNode.rightChild.value}";
        puts "Node count=#{@numberOfNodes}, depth of tree=#{@depth}";
        puts "";
        return true;
      end
    elsif depth > 0
      #if branch=="LEFT"
      if AddNode(val, depth-1, currentNode.leftChild)
        return true;
      #elsif branch=="RIGHT"
      elsif AddNode(val, depth-1, currentNode.rightChild)
        return true;
      else
        return false;
      end
    end
  end      
  
  def DisplayTree()
    
  end
end


treeObject= BinaryTree.new();
treeObject.AddNode(10);
treeObject.AddNode(20);
treeObject.AddNode(30);
treeObject.AddNode(40);
treeObject.AddNode(50);
treeObject.AddNode(60);
treeObject.AddNode(70);
treeObject.AddNode(80);
treeObject.AddNode(90);
treeObject.AddNode(100);
