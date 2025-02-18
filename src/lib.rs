use arma_rs::{arma, Extension};

use enigo::{Enigo, Key, KeyboardControllable};

fn screenshot() {
    Enigo::new().key_click(Key::F12);
}

#[arma]
fn init() -> Extension {
    Extension::build()
        .command("screenshot", screenshot)
        .finish()
}
