import {
  Button,
  Layout,
  Table,
  TableProps,
  Tag,
  Input,
  Space,
  Row,
  Col,
  Modal
} from "antd";
import { useEffect, useMemo, useState } from "react";

const { Search } = Input;

interface Employee {
  MaNV: string;
  TenNV: string;
  GioiTinh: boolean;
  Luong: number;
  IsDeleted: boolean;
  MaPB: number;
}

const App = () => {
  const [employees, setEmployees] = useState<Employee[]>([]);
  const [isModalOpen, setIsModalOpen] = useState(false);

  const columns = useMemo(() => {
    if (employees.length === 0) return [];

    const result: TableProps<Employee>["columns"] = [];

    const firstEmployee = employees[0];
    for (const key in firstEmployee) {
      result.push({
        title: key,
        dataIndex: key,
        key,
        render: (value) => {
          if (key === "IsDeleted")
            return (
              <Tag color={value ? "success" : "error"}>
                {value ? "Yes" : "No"}
              </Tag>
            );
          if (key === "GioiTinh")
            return (
              <Tag color={value ? "blue" : "pink"}>{value ? "Nam" : "Nu"}</Tag>
            );

          return value;
        }
      });
    }

    return result;
  }, [employees]);

  const onSearch = () => {};

  const showModal = () => {
    setIsModalOpen(true);
  };

  const handleOk = () => {
    setIsModalOpen(false);
  };

  const handleCancel = () => {
    setIsModalOpen(false);
  };

  useEffect(() => {
    fetch(`${import.meta.env.VITE_API_URL}/api/employees`)
      .then((res) => res.json())
      .then((data) => setEmployees(data))
      .catch((error) => console.error(error));
  }, []);

  return (
    <Layout
      style={{
        padding: 20,
        height: "100vh",
        width: "100%",
        background: "white"
      }}
    >
      <Modal
        title="Basic Modal"
        open={isModalOpen}
        onOk={handleOk}
        onCancel={handleCancel}
      >
        <p>Some contents...</p>
        <p>Some contents...</p>
        <p>Some contents...</p>
      </Modal>

      <Space direction="vertical" size="large">
        <Row justify={"end"}>
          <Col span={12} md={8} lg={6}>
            <Search
              placeholder="Tìm kiếm tên nhân viên"
              onSearch={onSearch}
              enterButton
            />
          </Col>
          <Col span={12} md={16} lg={18} flex={"auto"}></Col>
          <Col>
            <Button type="primary" onClick={showModal}>
              Add
            </Button>
          </Col>
        </Row>

        <Table
          dataSource={employees}
          columns={columns}
          rowKey={(record) => record.MaNV}
        ></Table>
      </Space>
    </Layout>
  );
};

export default App;
