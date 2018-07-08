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

    def win
    end
    
    def new
        @node = Node.new
    end

    def create
        @node = Node.new(node_params)
        @node.save
    end

    def validateResult(rowNumber, columnNumber)
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
        # validateBasedOnTheLatestNode(rowNumber, columnNumber)
        # if rowNumber >= 3
        #     validateTopLeftToRightButtom(rowNumber, columnNumber)
        # end
        redirect_to nodes_url
    end

    def validateBasedOnTheLatestNode(rowNumber, columnNumber)
        rowArray = [@row1, @row2, @row3, @row4, @row5, @row6, @row7]
        i = 0
        tempForA = 1
        tempForB = 1
        while rowNumber + i <=6 && columnNumber + i <=6
            if rowArray[rowNumber+i+1][columnNumber+i+1] !=nil
                if rowArray[rowNumber+i+1][columnNumber+i+1].belongsTo != rowArray[rowNumber+i][columnNumber+i].belongsTo
                    break
                elsif rowArray[rowNumber+i+1][columnNumber+i+1].belongsTo == rowArray[rowNumber+i][columnNumber+i].belongsTo
                    if rowArray[rowNumber+i+1][columnNumber+i+1].belongsTo == 'A'
                        tempForA +=1
                    elsif rowArray[rowNumber+i+1][columnNumber+i+1].belongsTo == 'B'
                        tempForB +=1
                    end
                    if tempForA == 4
                        @A.winner = true
                        @A.save
                        break
                    elsif tempForB == 4
                        @B.winner = true
                        @B.save
                        break
                    end
                end
            end
        end
        if tempForA > 1
            while rowNumber - i >=0 && columnNumber - i >= 0
                if rowArray[rowNumber-i-1][columnNumber-i-1] != nil
                    if rowArray[rowNumber-i-1][columnNumber-i-1].belongsTo != rowArray[rowNumber-i][columnNumber-i].belongsTo
                        break
                    elsif rowArray[rowNumber-i-1][columnNumber-i-1].belongsTo == rowArray[rowNumber-i][columnNumber-i].belongsTo
                        if rowArray[rowNumber-i-1][columnNumber-i-1].belongsTo == 'B'
                            break
                        else
                            tempForA += 1
                            if tempForA == 4
                                @A.winner = true
                                @A.save
                                break
                            end
                        end
                    end
                end
            end
        end
        if tempForB > 1
            while rowNumber - i >=0 && columnNumber - i >= 0
                if rowArray[rowNumber-i-1][columnNumber-i-1] != nil
                    if rowArray[rowNumber-i-1][columnNumber-i-1].belongsTo != rowArray[rowNumber-i][columnNumber-i].belongsTo
                        break
                    elsif rowArray[rowNumber-i-1][columnNumber-i-1].belongsTo == rowArray[rowNumber-i][columnNumber-i].belongsTo
                        if rowArray[rowNumber-i-1][columnNumber-i-1].belongsTo == 'A'
                            break
                        else
                            tempForB += 1
                            if tempForB == 4
                                @B.winner = true
                                @B.save
                                break
                            end
                        end
                    end
                end
            end
        end

        ## TODO: from top left to right buttom
    end

    def validateTopLeftToRightButtom(rowNumber, columnNumber)
        @rowArray = [@row1, @row2, @row3, @row4, @row5, @row6, @row7]
        if rowNumber >= 6
            validateLTtoRB1
            validateLTtoRB2
            validateLTtoRB3
            validateLTtoRB4
        elsif rowNumber >=5
            validateLTtoRB2
            validateLTtoRB3
            validateLTtoRB4
        elsif rowNumber >=4
            validateLTtoRB3
            validateLTtoRB4
        else rowNumber >=3
            validateLTtoRB4
        end
    end
        
    def validateLTtoRB1
        tempForA = 1
        tempForB = 1
        i = 0
        while @rowArray[6-i][i]!=nil && @rowArray[6-i-1][i+1]!=nil && i<=5
            if @rowArray[6-i][i].belongsTo == @rowArray[6-i-1][i+1].belongsTo && @rowArray[6-i][i].belongsTo == 'A'
                tempForA +=1
                if tempForA == 4
                    @A.winner = true
                    @A.save
                    break
                end
                i +=1
            elsif @rowArray[6-i][i].belongsTo == @rowArray[6-i-1][i+1].belongsTo && @rowArray[6-i][i].belongsTo == 'B'
                tempForB +=1
                if tempForB == 4
                    @B.winner = true
                    @B.save
                    break
                end
                i +=1
            end
        end
    end

    def validateLTtoRB2
        tempForA = 1
        tempForB = 1
        i = 0
        while @rowArray[5-i][i]!=nil && @rowArray[5-i-1][i+1]!=nil && i<=4
            if @rowArray[5-i][i].belongsTo == @rowArray[5-i-1][i+1].belongsTo && @rowArray[5-i][i].belongsTo == 'A'
                tempForA +=1
                if tempForA == 4
                    @A.winner = true
                    @A.save
                    break
                end
                i +=1
            elsif @rowArray[5-i][i].belongsTo == @rowArray[5-i-1][i+1].belongsTo && @rowArray[5-i][i].belongsTo == 'B'
                tempForB +=1
                if tempForB == 4
                    @B.winner = true
                    @B.save
                    break
                end
                i +=1
            end
        end
    end

    def validateLTtoRB3
        tempForA = 1
        tempForB = 1
        i = 0
        while @rowArray[4-i][i]!=nil && @rowArray[4-i-1][i+1]!=nil && i<=3
            if @rowArray[4-i][i].belongsTo == @rowArray[4-i-1][i+1].belongsTo && @rowArray[4-i][i].belongsTo == 'A'
                tempForA +=1
                if tempForA == 4
                    @A.winner = true
                    @A.save
                    break
                end
                i +=1
            elsif @rowArray[4-i][i].belongsTo == @rowArray[4-i-1][i+1].belongsTo && @rowArray[4-i][i].belongsTo == 'B'
                tempForB +=1
                if tempForB == 4
                    @B.winner = true
                    @B.save
                    break
                end
                i +=1
            end
        end
    end

    def validateLTtoRB4(columnNumber)
        tempForA = 1
        tempForB = 1
        i = 0
        while @rowArray[3-i][i]!=nil && @rowArray[3-i-1][i+1]!=nil && i<=2
            if @rowArray[3-i][i].belongsTo == @rowArray[3-i-1][i+1].belongsTo && @rowArray[3-i][i].belongsTo == 'A'
                tempForA +=1
                if tempForA == 4
                    @A.winner = true
                    @A.save
                    break
                end
                i +=1
            elsif @rowArray[3-i][i].belongsTo == @rowArray[3-i-1][i+1].belongsTo && @rowArray[3-i][i].belongsTo == 'B'
                tempForB +=1
                if tempForB == 4
                    @B.winner = true
                    @B.save
                    break
                end
                i +=1
            end
        end
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
                validateResult(i,0) and return
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
