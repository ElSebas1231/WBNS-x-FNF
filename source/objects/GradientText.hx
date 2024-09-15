package objects;

import flixel.group.FlxGroup;

class GradientText extends FlxGroup {
    public var startX:Float;
    public var startY:Float;
    public var text:String;
    public var size:Int;
    public var font:String;
    public var colorStart:Int;
    public var colorEnd:Int;
    public var charTexts:Array<FlxText>;
    public var alignment:FlxTextAlign;
    public var textWidth:Float = 0;

    public function new(x:Float, y:Float, text:String, size:Int, font:String, colorStart:Int, colorEnd:Int, alignment:FlxTextAlign = LEFT) {
        super();
        this.startX = x;
        this.startY = y;
        this.text = text;
        this.size = size;
        this.font = font;
        this.colorStart = colorStart;
        this.colorEnd = colorEnd;
        this.alignment = alignment;
        this.charTexts = [];
        createGradientText();
    }

    private function createGradientText():Void {
        clearTexts();

        textWidth = 0;
        var x:Float = this.startX;

        for (i in 0...text.length) {
            var tempChar:FlxText = new FlxText(0, 0, 0, text.charAt(i));
            textWidth += tempChar.width;
            tempChar.destroy();
        }

        if (alignment == FlxTextAlign.CENTER) {
            x -= textWidth / 2;
        } else if (alignment == FlxTextAlign.RIGHT) {
            x -= textWidth;
        }

        for (i in 0...text.length) {
            var ratio:Float = i / (text.length - 1);
            var color:Int = FlxColor.interpolate(colorStart, colorEnd, ratio);

            var charText:FlxText = new FlxText(x, startY, 0, text.charAt(i));
            charText.setFormat(Paths.font(font), size);
            charText.antialiasing = ClientPrefs.data.antialiasing;
            charText.color = color;

            x += charText.width;
            add(charText);
            charTexts.push(charText);
        }
    }

    private function clearTexts():Void {
        for (charText in charTexts) {
            charText.destroy();
        }
        charTexts = [];
    }

    public function setText(newText:String, newFont:String):Void {
        if (newText != this.text) {
            this.text = newText;
            this.font = newFont;
            createGradientText();
        }
    }

    public function setPosition(newX:Float, newY:Float):Void {
        this.startX = newX;
        this.startY = newY;
        updatePosition();
    }

    public function setColorRange(newColorStart:Int, newColorEnd:Int):Void {
        this.colorStart = newColorStart;
        this.colorEnd = newColorEnd;
        updateColors();
    }

    public function setAlignment(newAlignment:FlxTextAlign):Void {
        if (newAlignment != this.alignment) {
            this.alignment = newAlignment;
            updatePosition();
        }
    }

    private function updatePosition():Void {
        var x:Float = this.startX;
        var textWidth:Float = 0;

        // Calcular el ancho total para la alineación
        for (charText in charTexts) {
            textWidth += charText.width;
        }

        if (alignment == FlxTextAlign.CENTER) {
            x -= textWidth / 2;
        } else if (alignment == FlxTextAlign.RIGHT) {
            x -= textWidth;
        }

        for (charText in charTexts) {
            charText.setPosition(x, startY);
            x += charText.width;
        }
    }

    private function updateColors():Void {
        for (i in 0...charTexts.length) {
            var ratio:Float = i / (charTexts.length - 1);
            var color:Int = FlxColor.interpolate(colorStart, colorEnd, ratio);
            charTexts[i].color = color;
        }
    }
}