function aamove (data){
            var _self = this;
            _self.id = data.id;
            _self.relay();
        }
aamove.prototype = {
    relay:function(){
        var _self = this;
        console.log(1);
        _self.add();
    },
    add :function(){
        console.log("ass");
    }
}