#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "php.h"
#include "php_ini.h"
#include "ext/standard/info.h"
#include "php_noeval.h"

#if PHP_VERSION_ID >= 50500
void (*noeval_old_execute_ex)(zend_execute_data *execute_data TSRMLS_DC);
void noeval_execute_ex(zend_execute_data *execute_data TSRMLS_DC);
#else
void (*noeval_old_execute)(zend_op_array *op_array TSRMLS_DC);
void noeval_execute(zend_op_array *op_array TSRMLS_DC);
#endif

#if PHP_VERSION_ID >= 50500
void noeval_execute_ex(zend_execute_data *execute_data TSRMLS_DC)
{
#else
void noeval_execute(zend_op_array *op_array TSRMLS_DC)
{
	zend_execute_data    *execute_data = EG(current_execute_data);
#endif

	if (
		execute_data->opline &&
		execute_data->opline->opcode == ZEND_INCLUDE_OR_EVAL &&
		execute_data->opline->extended_value == ZEND_EVAL
	) {
		zend_error(E_ERROR, "Eval is disabled.");
		return;
	}

#if PHP_VERSION_ID < 50500
	noeval_old_execute(op_array TSRMLS_CC);
#else
	noeval_old_execute_ex(execute_data TSRMLS_CC);
#endif
}

PHP_MINIT_FUNCTION(noeval)
{
#if PHP_VERSION_ID < 50500
	noeval_old_execute = zend_execute;
	zend_execute = noeval_execute;
#else
	noeval_old_execute_ex = zend_execute_ex;
	zend_execute_ex = noeval_execute_ex;
#endif

	return SUCCESS;
}

PHP_MSHUTDOWN_FUNCTION(noeval)
{
	return SUCCESS;
}

PHP_MINFO_FUNCTION(noeval)
{
	php_info_print_table_start();
	php_info_print_table_header(2, "eval", "disabled");
	php_info_print_table_end();
}
const zend_function_entry noeval_functions[] = { PHP_FE_END };

zend_module_entry noeval_module_entry = {
	STANDARD_MODULE_HEADER,
	"noeval",
	noeval_functions,
	PHP_MINIT(noeval),
	PHP_MSHUTDOWN(noeval),
	NULL,
	NULL,
	PHP_MINFO(noeval),
	PHP_NOEVAL_VERSION,
	STANDARD_MODULE_PROPERTIES
};

#ifdef COMPILE_DL_NOEVAL
ZEND_GET_MODULE(noeval)
#endif
