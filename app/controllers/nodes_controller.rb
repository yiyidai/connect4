class NodesController < ApplicationController
    
    def index 
        @nodes = Node.all
        getRowAndColumn
        @players = Player.all
        @winnername = ''
        @players.each do |p|
            if p.active 
                @player = p
            else
                @inActivePlayer = p
            end
            if p.name == 'A'
                @A = p
            elsif p.name == 'B'
                @B = p
            end
            if p.winner == true
                @winner = p
                @winnername = p.name
            end
        end
    end

    def show
    end
    
    def new
        @node = Node.new
    end

    def create
        @node = Node.new(node_params)
        @node.save
    end

    def validateResult(rowNumber, columnNumber)
        rowArray = [@row1, @row2, @row3, @row4, @row5, @row6, @row7]
        validateRow(@row1)
        validateRow(@row2)
        validateRow(@row3)
        validateRow(@row4)
        validateRow(@row5)
        validateRow(@row6)
        validateRow(@row7)
        validateColumn(@column1)
        validateColumn(@column2)
        validateColumn(@column3)
        validateColumn(@column4)
        validateColumn(@column5)
        validateColumn(@column6)
        validateColumn(@column7)
        checkLeftDiagonal(rowNumber, columnNumber, rowArray)
        checkRightDiagonal(rowNumber, columnNumber, rowArray)
        redirect_to nodes_url
    end

    def checkLeftDiagonal(rowNumber, columnNumber, rowArray)
        count = 0
        # Set the initil position coordinate
        downright = [columnNumber,rowNumber];
        puts "initial downright #{downright}"
        # Get who is in play
        currentPlayer = @player
        puts "piece placed player #{currentPlayer}"
        # Set the upper left
        upleft = [columnNumber-1,rowNumber+1];
        puts "initial upleft #{upleft}"
        # Search up-left direction first
        # until it's already the most left and most top
        until upleft[0] < 0 || upleft[1] > 6 || count == 4
            puts "under until upleft #{upleft}"
            if isCurrentPlayerNode(upleft[1], upleft[0], rowArray, currentPlayer.name)
                count+=1
                upleft[0] -= 1 #move to next left one
                upleft[1] += 1 #move to next top one
                puts "count #{count}, new upleft #{upleft}"
            # If any piece doesn't belong to this palyer, stop counting immediately
            else
                break
            end
        end

        # Search down-right direction
        # until it's already the most right and most buttom
        until downright[0] > 6 || downright[1] < 0 || count == 4
            puts "under until, downright #{downright}"
            if isCurrentPlayerNode(downright[1], downright[0], rowArray, currentPlayer.name)
                count+=1
                downright[0] += 1 #move to next right
                downright[1] -= 1 #move to next down
                puts "count #{count}, new downright #{downright}"
            # If any piece doesn't belong to this palyer, stop counting immediately
            else
                break
            end
        end

        # If there are 
        if count == 4
            currentPlayer.winner = true
            currentPlayer.save
        end
    end

    def checkRightDiagonal(rowNumber, columnNumber, rowArray)
        downleft = [columnNumber,rowNumber]
        upright = [columnNumber+1,rowNumber+1]
        count = 0
        currentPlayer = @player
        
        until downleft[0]<0||downleft[1]<0||count==4
            if isCurrentPlayerNode(downleft[1], downleft[0], rowArray, currentPlayer.name)
                count+=1
                downleft[0] -=1
                downleft[1] -=1
            else
                break
            end
        end

        until upright[0]>6||upright[1]>6||count==4
            if isCurrentPlayerNode(upright[1], upright[0], rowArray, currentPlayer.name)
                count+=1
                upright[0]+=1
                upright[1]+=1
            else
                break
            end
        end

        if count == 4
            currentPlayer.winner = true
            currentPlayer.save
        end
    end


    def isCurrentPlayerNode(row, column, rowArray, player)
        puts "Current player: #{rowArray[row][column].belongsTo}"
        rowArray[row][column].belongsTo == player
    end

    def validateRow(rowArray)
        tempForA = 1
        tempForB = 1
        for i in 0..5
            if rowArray[i].belongsTo == rowArray[i+1].belongsTo && rowArray[i].belongsTo == 'A'
                tempForA +=1
                if tempForA ==4
                    @A.winner = true
                    @A.save
                    break
                    redirect_to nodes_url
                end
            elsif rowArray[i].belongsTo == rowArray[i+1].belongsTo && rowArray[i].belongsTo == 'B'
                tempForB +=1
                if tempForB == 4
                    @B.winner = true
                    @B.save
                    break
                    redirect_to nodes_url 
                end
            end
        end
    end
    def validateColumn(columnArray)
        tempForA = 1
        tempForB = 1
        for i in 0..5
            if columnArray[i].belongsTo == columnArray[i+1].belongsTo && columnArray[i].belongsTo == 'A'
                tempForA +=1
                if tempForA ==4
                    @A.winner = true
                    @A.save
                    break
                    redirect_to nodes_url
                end
            elsif columnArray[i].belongsTo == columnArray[i+1].belongsTo && columnArray[i].belongsTo == 'B'
                tempForB +=1
                if tempForB == 4
                    @B.winner = true
                    @B.save
                    break
                    redirect_to nodes_url 
                end
            end
        end
    end
    


    def click1
        index
        for i in 0..6
            while @column1[i].belongsTo == ''
                @column1[i].belongsTo = @player.name
                @column1[i].save
                @player.active = false
                @player.save
                @inActivePlayer.active = true
                @inActivePlayer.save
                validateResult(i,0) and return 
            end
            i+=1
        end
    end

    def click2
        index
        for i in 0..6
            while @column2[i].belongsTo == ''
                @column2[i].belongsTo = @player.name
                @column2[i].save
                @player.active = false
                @player.save
                @inActivePlayer.active = true
                @inActivePlayer.save
                validateResult(i,1) and return
            end
            i+=1
        end
    end
    def click3
        index
        for i in 0..6
            while @column3[i].belongsTo == ''
                @column3[i].belongsTo = @player.name
                @column3[i].save
                @player.active = false
                @player.save
                @inActivePlayer.active = true
                @inActivePlayer.save
                validateResult(i,2) and return
            end
            i+=1
        end
    end
    def click4
        index
        for i in 0..6
            while @column4[i].belongsTo == ''
                @column4[i].belongsTo = @player.name
                @column4[i].save
                @player.active = false
                @player.save
                @inActivePlayer.active = true
                @inActivePlayer.save
                validateResult(i,3) and return
            end
            i+=1
        end
    end
    def click5
        index
        for i in 0..6
            while @column5[i].belongsTo == ''
                @column5[i].belongsTo = @player.name
                @column5[i].save
                @player.active = false
                @player.save
                @inActivePlayer.active = true
                @inActivePlayer.save
                validateResult(i,4) and return
            end
            i+=1
        end
    end
    def click6
        index
        for i in 0..6
            while @column6[i].belongsTo == ''
                @column6[i].belongsTo = @player.name
                @column6[i].save
                @player.active = false
                @player.save
                @inActivePlayer.active = true
                @inActivePlayer.save
                validateResult(i,5) and return
            end
            i+=1
        end
    end
    def click7
        index
        for i in 0..6
            while @column7[i].belongsTo == ''
                @column7[i].belongsTo = @player.name
                @column7[i].save
                @player.active = false
                @player.save
                @inActivePlayer.active = true
                @inActivePlayer.save
                validateResult(i,6) and return
            end
            i+=1
        end
    end



    def getRowAndColumn
        @row1 = Array.new
        @column1 = Array.new
        @row2 = Array.new
        @column2 = Array.new
        @row3 = Array.new
        @column3 = Array.new
        @row4 = Array.new
        @column4 = Array.new
        @row5 = Array.new
        @column5 = Array.new
        @row6 = Array.new
        @column6 = Array.new
        @row7 = Array.new
        @column7 = Array.new

        @nodes.each do |n|
            if n.rowNumber == 0
                @row1.push(n)
            end
            if n.rowNumber == 1
                @row2.push(n)
            end
            if n.rowNumber == 2
                @row3.push(n)
            end
            if n.rowNumber == 3
                @row4.push(n)
            end
            if n.rowNumber == 4
                @row5.push(n)
            end
            if n.rowNumber == 5
                @row6.push(n)
            end
            if n.rowNumber == 6
                @row7.push(n)
            end
            if n.columnNumber == 0
                @column1.push(n)
            end
            if n.columnNumber == 1
                @column2.push(n)
            end
            if n.columnNumber == 2
                @column3.push(n)
            end
            if n.columnNumber == 3
                @column4.push(n)
            end
            if n.columnNumber == 4
                @column5.push(n)
            end
            if n.columnNumber == 5
                @column6.push(n)
            end
            if n.columnNumber == 6
                @column7.push(n)
            end
        end
    end





    private 
    def node_params
        params.require(:node).permit(:rowNumber, :columnNumber, :belongsTo)
    end


end
