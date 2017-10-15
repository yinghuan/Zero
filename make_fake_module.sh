#!/bin/sh

rm -rf "${BUILT_PRODUCTS_DIR}/Headers"
mkdir "${BUILT_PRODUCTS_DIR}/Headers"
find "${BUILT_PRODUCTS_DIR}" -name "*.h" |xargs -I {} cp {} "${BUILT_PRODUCTS_DIR}/Headers"

cp "$(dirname "$SRCROOT")/modules/$PRODUCT_NAME-umbrella.h" "${BUILT_PRODUCTS_DIR}/Headers"
cp "$(dirname "$SRCROOT")/modules/module.modulemap" "${BUILT_PRODUCTS_DIR}/Headers"