package;


class Enemy extends Actor{
    public var description:String;
    var chains:Array<Array<String>>;
    var currentChain:Int = 0;
    var currentLink:Int = 0;
    var chainOrder:Array<Int>;

    override function loadData(data:Dynamic){
        var statList:Array<Dynamic> = data.stats;
        for (i in 0...statList.length){
            if(i%2 == 0){
                stats[statList[i]] = statList[i+1];
            }
        }
        name = data.name;
        chains = new Array<Array<String>>();
        chainOrder = new Array<Int>();
        var chainList:Array<Dynamic> = data.chains;
        for (chain in chainList){
            chains.push(chain);
        }
        //sprite.loadGraphic(data.sprite);
        trace(data.sprite);
        if(data.sprite != ""){sprite.loadGraphic(data.sprite);}
    }

    public function act() {
        if(currentChain == 0){
            chainOrder.resize(0);
            for (i in 0...chains.length){chainOrder.push(i);}
            chainOrder = shuffleInt(chainOrder);
        }
        trace(chainOrder);
        trace(chains[currentChain][currentLink]);
        trace(currentLink);
        trace(currentChain);
        abilityCallback(gameData.abilities[ chains[currentChain][currentLink] ], this);
        currentLink++;
        if(currentLink == chains[currentChain].length){currentLink = 0; currentChain++;}
        if(currentChain == chains.length){currentChain = 0;}
    }
}