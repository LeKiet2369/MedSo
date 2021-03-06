import React, { PureComponent } from 'react';
import { StyleTable } from '../../../Styles';
import TinhThanhItem from '../../TinhThanhPageComponents/TinhThanhItem';
import { connect } from 'react-redux';


class TbTinhThanhComponent extends PureComponent {
    renderTinhThanhItem = () => {
        return this.props.listTinhThanh.map((item, index) => {
            return (
                <TinhThanhItem index={index + 1} item={item} key={index} />
            )
        })
    }
    render() {
        return (
                <StyleTable>
                    <table className="table">
                        <thead>
                            <tr>
                                <th scope="col">
                                    No.
                            </th>
                                <th scope="col">
                                    Mã tỉnh thành
                            </th>
                                <th scope="col">
                                    Tên tỉnh thanh
                            </th>
                                <th scope="col">
                                    Hệ số User
                            </th>
                                <th scope="col">
                                    Hệ số điều dưỡng
                            </th>
                                <th scope="col">
                                    Tùy chỉnh
                            </th>
                            </tr>
                        </thead>
                        <tbody>
                            {this.renderTinhThanhItem()}
                        </tbody>
                    </table>
                </StyleTable>
        );
    }
}
const mapStateToProps = state => ({
    listTinhThanh: state.qlTinhThanh.listTinhThanh
});
export default connect(mapStateToProps)(TbTinhThanhComponent);