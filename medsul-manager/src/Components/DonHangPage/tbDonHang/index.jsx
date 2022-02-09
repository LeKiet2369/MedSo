import React, { Component } from 'react';
import { PureComponent } from 'react';
import { StyleTable } from '../../../Styles';
import DonHangItem from '../DonHangItem';

class DonHangTable extends PureComponent {

    renderDonHangItem = () => {
        return this.props.listDonHang.map((item, index) => {
            return (
                <DonHangItem index={index + 1} item={item} key={index}/>
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
                                Tên Khách Hàng
                            </th>
                            <th scope="col">
                                Tên dịch vụ
                            </th>
                            <th scope="col">
                                Trạng thái
                            </th>
                            <th scope="col">
                                Số tiền giảm
                            </th>
                            <th scope="col">
                                Tổng tiền dịch vụ
                            </th>
                            <th scope="col">
                                Tùy chỉnh
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        {this.renderDonHangItem()}
                    </tbody>
                </table>
            </StyleTable>
        );
    }
}

const mapStateToProps = state => ({
    
});

export default DonHangTable;