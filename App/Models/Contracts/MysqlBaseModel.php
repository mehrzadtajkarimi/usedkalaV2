<?php

namespace App\Models\Contracts;

use Medoo\Medoo;

class  MysqlBaseModel extends BaseModel
{
    function __construct($id)
    {
        try {
            $this->connection = new Medoo([
                'type' => 'mysql',
                'host' => $_ENV['DB_HOST'],
                'database' => $_ENV['DB_NAME'],
                'username' => $_ENV['DB_USER'],
                'password' => $_ENV['DB_PASS'],
                'charset' => 'utf8mb4',
                'collation' => 'utf8mb4_general_ci',
                'port' => 3306,
                'prefix' => '',
                // [optional] Enable logging, it is disabled by default for better performance.
                'logging' => true,
                // PDO::ERRMODE_SILENT (default) | PDO::ERRMODE_WARNING | PDO::ERRMODE_EXCEPTION
                'error' => \PDO::ERRMODE_EXCEPTION,
            ]);
        } catch (\PDOException $e) {
            echo "Connection failed" . $e->getMessage();
        }

        if (!is_null($id)) {
            return $this->find($id);
        }
    }




    public function create(array $data): int
    {
        $this->connection->insert($this->table, $data);
        return  $this->connection->id();
    }

    public function find($id): object
    {
        $record = $this->connection->get($this->table, '*', [$this->primaryKey => $id]) ?? new \stdClass;
        foreach ($record as $key => $value) {
            $this->attributes[$key] = $value;
        }
        return $this;
    }

    public function all(): array
    {
        return $this->get('*');
    }

    public function get($columns, array $where = null): array
    {
        // start pagination ***to  url -> ?page=1
        $page = (isset($_GET['page']) && is_numeric($_GET['page'])) ? $_GET['page'] : 1;
        $start = ($page - 1) * $this->pageSize;
        $where['LIMIT'] = [$start, $this->pageSize];
        // end pagination

        return $this->connection->select($this->table, $columns, $where);
    }

    public function update(array $data, array $where): int
    {
        $result = $this->connection->update($this->table, $data, $where);
        return $result->rowCount();
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
}
