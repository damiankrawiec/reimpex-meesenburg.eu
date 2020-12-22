<?php

//init require element on the content in section (object), rest part of section are include
require_once 'content/object/object.class.php';

$object = new ObjectContent($this->systemName(), $db, $this->currentLanguage, $this->admin, $this->setting);

$sectionData = $this->getSection($this->currentSection);

$label = $object->getAllLabel();

?>

<div class="container">

    <?php $object->display($sectionData['id'], $label['logo']); ?>

</div>

<div class="container">

    <?php $object->display($sectionData['id'], $label['top']); ?>

</div>

<div class="container-fluid p-0">

    <?php $object->display($sectionData['id'], $label['menu']); ?>

</div>

<div class="container-fluid p-0">

    <?php $object->display($sectionData['id'], $label['slider']); ?>

</div>

<?php $divClass = ' class="'.($sectionData['class'] === '' ? 'container' : $sectionData['class']).'" id="'.$this->currentSection.'"'; ?>

<div class="<?php echo $this->setting['class-content']; ?>">

    <div<?php echo $divClass; ?>>

        <?php $object->display($sectionData['id'], $label['content-top']); ?>

        <?php $object->display($sectionData['id'], $label['content-center']); ?>

    </div>

</div>

<div<?php echo $divClass; ?>>

    <?php $object->display($sectionData['id'], $label['content-bottom']); ?>

    <?php

    //Static content (when in system is "static" dir, and file is named like current url section) - if both are false static content is not display
    //In static file should be defined class, rows, col, etc. - content fix to rest page box
    //Name of files may only string section - check in foreach(dir) and stristr()
    $object->displayStatic($sectionData['id']);

    ?>

</div>

<div class="container-fluid p-0">

    <?php $object->display($sectionData['id'], $label['map']); ?>

</div>

<div class="im-footer <?php echo $this->setting['class-footer']; ?>">

    <div class="container-fluid">

        <?php $object->display($sectionData['id'], $label['footer']); ?>

    </div>

</div>

<?php

if(!isset($session['cookie'])) {

    echo '<div class="container-fluid">';

        $object->display($sectionData['id'], $label['cookie']);

    echo '</div>';

}