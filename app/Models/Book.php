<?php

/**
 * Book model.
 */

namespace App\Models;

use Springy\DB\Where;
use Springy\Model;
use Springy\Validation\Validator;

class Book extends Model
{
    public const TABLE_NAME = 'book';

    // Column names
    public const COL_ID = 'id';
    public const COL_CREATED_AT = 'created_at';
    public const COL_DELETED = 'deleted';
    public const COL_AUTHOR = 'author';
    public const COL_TITLE = 'title';
    public const COL_PRICE = 'price';
    public const COL_ISBN = 'isbn';
    public const COL_STOCK = 'stock';
    public const COL_DESCRIPTION = 'description';
    public const COL_PUBLISHER = 'publisher';

    protected $tableName = self::TABLE_NAME;
    protected $tableColumns = '*';
    protected $insertDateColumn = self::COL_CREATED_AT;
    protected $deletedColumn = self::COL_DELETED;
    protected $writableColumns = [
        self::COL_AUTHOR,
        self::COL_TITLE,
        self::COL_PRICE,
        self::COL_ISBN,
        self::COL_STOCK,
        self::COL_DESCRIPTION,
        self::COL_PUBLISHER,
    ];
    protected $hookedColumns = [];
    protected $abortOnEmptyFilter = false;
}