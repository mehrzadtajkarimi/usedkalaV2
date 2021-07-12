<?php

namespace App\Models\Contracts;

use Medoo\Medoo;

class  MysqlBaseModel extends BaseModel
{
    function __construct($id = null)
    {
        try {
            $this->connection = new Medoo([
                'type'      => 'mysql',
                'host'      => $_ENV['DB_HOST'],
                'database'  => $_ENV['DB_NAME'],
                'username'  => $_ENV['DB_USER'],
                'password'  => $_ENV['DB_PASS'],
                'charset'   => 'utf8mb4',
                'collation' => 'utf8mb4_general_ci',
                'port'      => 3306,
                'prefix'    => '',
                // [optional] Enable logging, it is disabled by default for better performance.
                'logging' => true,
                // PDO::ERRMODE_SILENT (default) | PDO::ERRMODE_WARNING | PDO::ERRMODE_EXCEPTION
                'error' => \PDO::ERRMODE_EXCEPTION,
            ]);
        } catch (\PDOException $e) {
            echo '<h1>مشکلی در ارتباط با دیتابیس رخ داد </h1>';
        }

        if (!is_null($id)) {
            return $this->find($id);
        }
    }

    public function create(array $data)
    {
        try {
            $this->connection->insert($this->table, $data);
            return  $this->connection->id() ?? null;
        } catch (\PDOException $e) {
            echo 'مشکلی در هنگام ذخیره اطلاعات رخ داد/n' . $e->getMessage();
        }
    }

    public function find($id): object
    {
        $record = $this->connection->get($this->table, '*', [$this->primaryKey => $id]) ?? new \stdClass;
        foreach ($record as $key => $value) {
            $this->attributes[$key] = $value;
        }
        return $this;
    }

    public function count_by($field, $value)
    {
        return count($this->get($field, $value));
    }

    public function all(): array
    {
        return $this->get('*');
    }

    public function  get($columns, array $where = null): array
    {
        // start pagination ***to  url -> ?page=1
        $page    = (isset($_GET['page']) && is_numeric($_GET['page'])) ? $_GET['page'] : 1;
        $start   = ($page - 1) * $this->pageSize;
        $where['LIMIT'] = [$start, $this->pageSize];

        $where["ORDER"] = ["id" => "DESC"];
        // end pagination

        return $this->connection->select($this->table, $columns, $where);
    }

    public function  first(array $where)
    {
        $first = $this->connection->select($this->table, '*', $where);
        return  $first[0] ?? [];
    }

    public function update(array $data, array $where): int
    {
        try {
            $result = $this->connection->update($this->table, $data, $where);
            return $result->rowCount();
        } catch (\PDOException $e) {
            echo '<h1>مشکلی در ارتباط با دیتابیس رخ داد </h1>';
        }
    }

    public function update_create(array $data, array $where): int
    {
        try {
            $exists = $this->has($where);
            if (empty($exists)) {
                return  $this->create($data);
            }
            return $this->update($data, $where);
        } catch (\PDOException $e) {
            echo '<h1>مشکلی در ارتباط با دیتابیس رخ داد </h1>';
        }
    }

    public function delete(array $where): int
    {
        $result = $this->connection->delete($this->table,  $where);
        return $result->rowCount();
    }

    public function count(array $where): int
    {
        return $this->connection->count($this->table,  $where);
    }

    public function has(array $where): int
    {
        return $this->connection->has($this->table,  $where);
    }

    public function inner_join($join, $columns_as, $columns_to)
    {
        return  $this->connection->query("SELECT * FROM $this->table as c1  JOIN $join as c2 ON c1.$columns_as = c2.$columns_to")->fetchAll();
    }
}
