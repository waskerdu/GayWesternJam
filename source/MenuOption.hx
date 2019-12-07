package;

class MenuOption{
    public var name:String;
    public var description:String;
    public var func:(String->Void);
    public var arg:String;
    public function new(name, description, func, arg) {
        this.name = name;
        this.description = description;
        this.func = func;
        this.arg = arg;
    }
}