import { DeleteOutlined, EditFilled, PlusOutlined } from "@ant-design/icons";
import {
  Button,
  Layout,
  Table,
  Tag,
  Input,
  Space,
  Row,
  Col,
  TableColumnsType,
  Flex
} from "antd";
import { TableRowSelection } from "antd/es/table/interface";
import { useEffect, useMemo, useState } from "react";
import AddModal from "./components/AddModal";

const { Search } = Input;

export interface Department {
  MPB: number;
  TenPB: string;
  TruongPhong: string;
  IsDeleted: boolean;
}

export interface Employee {
  MaNV: number;
  TenNV: string;
  GioiTinh: boolean;
  Luong: number;
  IsDeleted: boolean;
  PhongBan: Department[];
}

const App = () => {
  const [employees, setEmployees] = useState<Employee[]>([]);
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [selectedRowKeys, setSelectedRowKeys] = useState<React.Key[]>([]);
  const [loading, setLoading] = useState(false);

  // imporve performance
  const columns = useMemo(() => {
    if (employees.length === 0) return [];

    const firstEmployee = employees[0];

    const result: TableColumnsType<Employee> = [];

    for (const key in firstEmployee) {
      result.push({
        title: key,
        dataIndex: key,
        key,
        render: (value) => {
          switch (key) {
            case "IsDeleted":
              return (
                <Tag color={value ? "success" : "error"}>
                  {value ? "Yes" : "No"}
                </Tag>
              );
            case "GioiTinh":
              return (
                <Tag color={value ? "blue" : "pink"}>
                  {value ? "Nam" : "Nu"}
                </Tag>
              );
            case "PhongBan":
              return value[0].TenPB;
            default:
              return value;
          }
        }
      });
    }

    result.push({
      title: "Actions",
      key: "actions",
      render: () => {
        return (
          <Space size={"middle"}>
            <Button type="primary" icon={<EditFilled />}>
              Edit
            </Button>
            <Button
              type="primary"
              icon={<DeleteOutlined />}
              loading={loading}
              danger
            >
              Delete
            </Button>
          </Space>
        );
      }
    });

    return result;
  }, [employees, loading]);

  const onSearch = async (value: string) => {
    if (!value) return;
  };

  const showModal = () => {
    setIsModalOpen(true);
  };

  const onSelectChange = (newSelectedRowKeys: React.Key[]) => {
    setSelectedRowKeys(newSelectedRowKeys);
  };

  const rowSelection: TableRowSelection<Employee> = {
    selectedRowKeys,
    onChange: onSelectChange
  };

  useEffect(() => {
    fetch(`${import.meta.env.VITE_API_URL}/api/employees`)
      .then((res) => res.json())
      .then((data) => setEmployees(data))
      .catch((error) => console.error(error));
  }, []);

  const hasSelected = selectedRowKeys.length > 0;

  return (
    <Layout
      style={{
        padding: 20,
        height: "100vh",
        width: "100%",
        background: "white"
      }}
    >
      <AddModal
        isModalOpen={isModalOpen}
        closeModal={() => setIsModalOpen(false)}
        setEmployees={setEmployees}
      />

      <Space direction="vertical" size="large">
        <Row justify={"end"}>
          <Col span={12} md={8} lg={6}>
            <Search
              placeholder="Search by name"
              onSearch={onSearch}
              enterButton
            />
          </Col>
          <Col span={12} md={16} lg={18} flex={"auto"}></Col>
          <Col>
            <Button type="primary" icon={<PlusOutlined />} onClick={showModal}>
              Add
            </Button>
          </Col>
        </Row>

        <Space direction="vertical" size={"middle"} style={{ display: "flex" }}>
          <Flex gap={8} align="center">
            <Button
              type="primary"
              disabled={!hasSelected}
              loading={loading}
              icon={<DeleteOutlined />}
              danger
            >
              Delete
            </Button>
            <span>
              {hasSelected ? `Selected ${selectedRowKeys.length} items` : ""}
            </span>
          </Flex>
          <Table
            dataSource={employees}
            columns={columns}
            rowKey={(record) => record.MaNV}
            rowSelection={rowSelection}
          ></Table>
        </Space>
      </Space>
    </Layout>
  );
};

export default App;
