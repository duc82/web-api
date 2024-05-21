import type { Department, Employee } from "@/App";
import {
  FormProps,
  Input,
  Modal,
  Form,
  Button,
  Select,
  InputNumber,
  message
} from "antd";
import { useEffect, useState } from "react";

interface AddModalProps {
  isModalOpen: boolean;
  closeModal: () => void;
  setEmployees: React.Dispatch<React.SetStateAction<Employee[]>>;
}

interface Field extends Employee {
  MaPB: number;
}

const AddModal = ({ isModalOpen, closeModal, setEmployees }: AddModalProps) => {
  const [form] = Form.useForm();
  const [departments, setDepartments] = useState<Department[]>([]);
  const [loading, setLoading] = useState(false);
  const [messageApi] = message.useMessage();

  const handleOk = () => {
    form.submit();
  };

  const handleCancel = () => {
    closeModal();
  };

  const showErrorMessage = (content: string) => {
    messageApi.open({
      type: "error",
      content
    });
  };

  const onFinish: FormProps<Field>["onFinish"] = async (values) => {
    try {
      setLoading(true);
      const res = await fetch(`${import.meta.env.VITE_API_URL}/api/employees`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify(values)
      });

      const data = await res.json();

      if (!res.ok) {
        showErrorMessage(data.message);
        return;
      }

      setEmployees((prev) => [...prev, values]);

      closeModal();
    } catch (error) {
      showErrorMessage(
        error instanceof Error ? error.message : "Failed to add employee"
      );
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetch(`${import.meta.env.VITE_API_URL}/api/departments`)
      .then((res) => res.json())
      .then((data) => setDepartments(data))
      .catch((error) => console.error(error));
  }, []);

  return (
    <Modal
      title="Add Employee"
      open={isModalOpen}
      onCancel={handleCancel}
      footer={[
        <Button key="back" onClick={handleCancel}>
          Cancel
        </Button>,
        <Button
          key="submit"
          type="primary"
          loading={loading}
          onClick={handleOk}
        >
          Submit
        </Button>
      ]}
    >
      <Form
        name="basic"
        form={form}
        layout="vertical"
        style={{ maxWidth: 600 }}
        onFinish={onFinish}
        autoComplete="off"
        initialValues={{
          GioiTinh: true,
          MaPB: departments[0]?.MPB ?? ""
        }}
      >
        <Form.Item<Field>
          label="Ten NV"
          name="TenNV"
          hasFeedback
          rules={[{ required: true, message: "Please input your name!" }]}
        >
          <Input />
        </Form.Item>

        <Form.Item<Field>
          label="Gioi Tinh"
          name="GioiTinh"
          hasFeedback
          rules={[{ required: true, message: "Please select gender!" }]}
        >
          <Select>
            <Select.Option value={true}>Nam</Select.Option>
            <Select.Option value={false}>Nu</Select.Option>
          </Select>
        </Form.Item>

        <Form.Item<Field>
          label="Luong"
          name="Luong"
          hasFeedback
          rules={[{ required: true, message: "Please input your salary!" }]}
        >
          <InputNumber min={1} style={{ width: "100%" }} />
        </Form.Item>

        <Form.Item<Field>
          label="Phong Ban"
          name="MaPB"
          hasFeedback
          rules={[{ required: true, message: "Please select department!" }]}
        >
          <Select>
            {departments.map((department) => (
              <Select.Option key={department.MPB} value={department.MPB}>
                {department.TenPB}
              </Select.Option>
            ))}
          </Select>
        </Form.Item>
      </Form>
    </Modal>
  );
};

export default AddModal;
