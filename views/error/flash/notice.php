<div class='flash-messages'>
    <?php

    use App\Utilities\FlashMessage;

    foreach ($flash_messages as $fm) :
    ?>
        <div class="alert alert-<?= FlashMessage::getCssClass($fm->type) ?> alert-dismissible fade show" role="alert">
            <?= $fm->msg ?>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class='flash-message <?= FlashMessage::getCssClass($fm->type) ?>'>
            <?= $fm->msg ?>
        </div>
    <?php endforeach; ?>
</div>