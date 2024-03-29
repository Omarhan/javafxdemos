   /*
 * LightChoice.fx
 *
 * Created on 16 Mar, 2009, 4:45:29 PM
 */

package lighteffect;

import javafx.ext.swing.SwingRadioButton;
import javafx.ext.swing.SwingToggleGroup;
import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.text.Font;
import javafx.scene.text.FontWeight;
import javafx.scene.layout.HBox;

/**
 * @author Rakesh Menon
 */

public class LightChoice extends CustomNode {

    var font = Font.font("sansserif", FontWeight.REGULAR, 12);

    var toggleGroup = SwingToggleGroup {
    };
    var selectedButton = bind toggleGroup.getSelection() on replace {
        updateLight(selectedButton.text);
    }

    var distantLightButton = SwingRadioButton {
        text: "DistantLight"
        font: font
        foreground: Color.BLACK
        toggleGroup: toggleGroup
        selected: true
    }

    var pointLightButton = SwingRadioButton {
        text: "PointLight"
        font: font
        foreground: Color.BLACK
        toggleGroup: toggleGroup
    }

    var spotLightButton = SwingRadioButton {
        text: "SpotLight"
        font: font
        foreground: Color.BLACK
        toggleGroup: toggleGroup
    }

    public var distantLight = bind distantLightButton.selected;
    public var pointLight = bind pointLightButton.selected;
    public var spotLight = bind spotLightButton.selected;

    override function create() : Node {
        HBox {
            content: [
                distantLightButton, pointLightButton, spotLightButton
            ]
            spacing: 5
        }
    }

    public var updateLight = function(lightType : String) : Void { }
}
