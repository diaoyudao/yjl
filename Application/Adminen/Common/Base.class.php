<?php
namespace Adminen\Common;

class Base
{
    /**
     * @param string $string
     *
     * @return bool
     */
    function str_has_tags($string)
    {
        return is_string($string)
        && strlen($string) > 2
        && $string !== strip_tags($string);
    }

    function array_set_in(array &$target, array $path, $value, $push = false)
    {
        $last_key = array_pop($path);

        foreach ($path as $key) {
            if (!array_key_exists($key, $target)) {
                $target[$key] = [];
            }

            $target = &$target[$key];

            if (!is_array($target)) {
                throw new \RuntimeException('Cannot use a scalar value as an array');
            }
        }

        if ($push) {
            if (!array_key_exists($last_key, $target)) {
                $target[$last_key] = [];
            } elseif (!is_array($target[$last_key])) {
                throw new \RuntimeException('Cannot use a scalar value as an array');
            }

            array_push($target[$last_key], $value);
        } else {
            $target[$last_key] = $value;
        }
    }

    /**
     * // set in
     * $target[$path] = $value;.
     *
     * // push in
     * $target[$path][] = $value;
     */
    function array_push_in(array &$target, array $path, $value)
    {
        return array_set_in($target, $path, $value, true);
    }

    function array_get_in(array $target, array $path)
    {
        foreach ($path as $key) {
            if (!isset($target[$key])) {
                return false;
            }

            $target = &$target[$key];
        }

        return $target;
    }

    function array_unset_in(array &$target, array $path)
    {
        $last_key = array_pop($path);

        foreach ($path as $key) {
            if (!is_array($target)) {
                return;
            }

            if (!array_key_exists($key, $target)) {
                return;
            }

            $target = &$target[$key];
        }

        unset($target[$last_key]);
    }

    /**
     * @example
     * $value = [
     *     'a' => [
     *         'b' => [],
     *     ],
     *     'c' => [
     *         'd' => [
     *             'e' => 1,
     *         ],
     *     ],
     * ];
     *
     * // [
     * //     'c' => [
     * //         'd' => [
     * //             'e' => 1,
     * //         ],
     * //     ],
     * // ];
     * $value = \Owl\array_trim($value);
     */
    function array_trim(array $target)
    {
        $keys = array_keys($target);
        $is_array = ($keys === array_keys($keys));

        $result = [];

        foreach ($target as $key => $value) {
            if (is_array($value) && $value) {
                $value = array_trim($value);
            }

            if ($value === null || $value === '' || $value === []) {
                continue;
            }

            $result[$key] = $value;
        }

        if ($is_array && $result) {
            $result = array_values($result);
        }

        return $result;
    }

    function safe_json_encode($value, $options = 0, $depth = 512)
    {
        $value = json_encode($value, $options, $depth);

        if ($value === false && json_last_error() !== JSON_ERROR_NONE) {
            throw new \UnexpectedValueException(json_last_error_msg(), json_last_error());
        }

        return $value;
    }

    function safe_json_decode($json, $assoc = false, $depth = 512, $options = 0)
    {
        $value = json_decode($json, $assoc, $depth, $options);

        if ($value === null && json_last_error() !== JSON_ERROR_NONE) {
            throw new \UnexpectedValueException(json_last_error_msg(), json_last_error());
        }

        return $value;
    }
	
    /**
     * 获取数组列，解决5.5之前版本没有该函数的问题
     */
	static function array_column($arr, $col_name)
	{
        $result = [];
        foreach ($arr as $item) {
            $result[] = $item[$col_name];
        }
        return $result;
	}

    public function getMenu()
    {
        return C('en_menu_privilege_list');
    }
    
    static public function removeColumn($array, $column)
    {
        foreach ($array as $key => $item) {
            unset($array[$key][$column]);
        }

        return $array;
    }
}
