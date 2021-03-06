import React, { Component } from 'react';
import { StyledModel } from '../../../Styles';
import avatarImg from '../../../img/avatar/avatar_1.jpg';
import CMNDImg from '../../../img/indentityCard_Img.svg';
import { connect } from 'react-redux';
import { createAction } from '../../../Redux/actions';
import { CHECK_EXIST_CMND_MANAGER, CHECK_EXIST_EMAIL_MANAGER, CHECK_EXIST_SDT_MANAGER, HIRE_MODAL_MANAGER } from '../../../Redux/actions/type';
import { capNhatManager, themManager } from '../../../Redux/actions/managerAction';
import swal from 'sweetalert';
class ModalManager extends Component {
    HandleHireModal = () => {
        this.props.dispatch(createAction(HIRE_MODAL_MANAGER, {}));
    }
    state = {
        item: {},
        oldItem: {
            admin_USERNAME: '',
        },
    }

    handleChange_Number = (e) => {
        this.setState({
            item: { ...this.state.item, [e.target.name]: parseInt(e.target.value) }
        });
    }
    handleChangeEmail = (e) => {
        this.setState({
            item: { ...this.state.item, [e.target.name]: e.target.value }
        }, () => {
            this.props.dispatch(createAction(CHECK_EXIST_EMAIL_MANAGER, this.state.item.admin_EMAIL.slice(0, this.state.item.admin_EMAIL.lastIndexOf('@'))));
        });
    }
    handleChangeCMND = e => {
        this.setState({
            item: { ...this.state.item, [e.target.name]: e.target.value }
        }, () => {
            let value = this.state.item.admin_CMND;
            this.props.dispatch(createAction(CHECK_EXIST_CMND_MANAGER, value));
        });
    }
    handleChangeSDT = e => {
        this.setState({
            item: { ...this.state.item, [e.target.name]: e.target.value }
        }, () => {
            let value = this.state.item.admin_SDT;
            this.props.dispatch(createAction(CHECK_EXIST_SDT_MANAGER, value));
        });
    }

    handleChange = e => {
        this.setState({
            item: { ...this.state.item, [e.target.name]: e.target.value }
        });

    }
    handleSubmit = e => {
        e.preventDefault();
        const {
            admin_ID, admin_PASSWORD, admin_CMNDMATSAU, admin_CMNDNOICAP,
            admin_CMNDMATTRUOC, admin_CMNDNGAYCAP, admin_TINHTRANG, admin_HOTEN,
            admin_AVATAR, admin_CHUCVU, admin_EMAIL, admin_NGAYSINH, admin_GIOITINH,
            admin_SDT, admin_DIACHI, admin_USERNAME, admin_CMND
        } = this.state.item;
        let username = admin_EMAIL.slice(0, admin_EMAIL.lastIndexOf('@'));
        // console.log(username);
        let itemAdd = {
            admin_AVATAR: this.props.role === 1 ? "string" : admin_AVATAR,
            admin_CHUCVU: admin_CHUCVU,
            admin_CMND: admin_CMND,
            admin_CMNDMATSAU: this.props.role === 1 ? "string" : admin_CMNDMATSAU,
            admin_CMNDMATTRUOC: this.props.role === 1 ? "string" : admin_CMNDMATTRUOC,
            admin_CMNDNGAYCAP: admin_CMNDNGAYCAP,
            admin_CMNDNOICAP: admin_CMNDNOICAP,
            admin_DIACHI: admin_DIACHI,
            admin_EMAIL: admin_EMAIL,
            admin_GIOITINH: admin_GIOITINH,
            admin_HOTEN: admin_HOTEN,
            admin_NGAYSINH: admin_NGAYSINH,
            admin_PASSWORD: this.props.role === 1 ? '123' : admin_PASSWORD,
            admin_SDT: admin_SDT,
            admin_TINHTRANG: this.props.role === 1 ? 1 : admin_TINHTRANG,
            admin_USERNAME: this.props.role === 1 ? username : admin_USERNAME
        };
        console.log(itemAdd);
        if (this.props.role === 1) {
            if (this.props.isExistCMND) {
                swal({
                    title: "???? t???n t???i!",
                    text: "Vui l??ng ki???m tra l???i CMND!!",
                    icon: "warning",
                });
            };
            if (this.props.isExistSDT) {
                swal({
                    title: "???? t???n t???i!",
                    text: "Vui l??ng ki???m tra l???i SDT!!",
                    icon: "warning",
                });
            };
            if (this.props.isExistEmail) {
                swal({
                    title: "???? t???n t???i!",
                    text: "Vui l??ng ki???m tra l???i Email!!",
                    icon: "warning",
                });
            }
            let valueCheck = !(this.props.isExistEmail && this.props.isExistCMND && this.props.isExistSDT);
            if (valueCheck) {
                this.props.dispatch(themManager(itemAdd, () => {
                    swal({
                        title: "Th??nh c??ng !!",
                        text: 'B???n ???? th??m th??nh c??ng m???t qu???n tr??? vi??n m???i !',
                        icon: "success",
                    });
                    this.HandleHireModal();
                }));
            }


        } else if (this.props.role === 3) {
            let username = '';
            if (username !== this.state.oldItem.admin_USERNAME) {
                if (!this.props.isExistEmail) {
                    swal({
                        title: "B???n Ch???c Ch????",
                        text: `N???u ?????ng ?? d??? li???u s??? thay ?????i!`,
                        icon: "info",
                        buttons: true,
                    }).then((willDelete) => {
                        if (willDelete) {
                            swal(`D??? li???u ???? ???????c c???p nh???t!`, {
                                icon: "success",
                            });
                            this.props.dispatch(capNhatManager(admin_ID, itemAdd, this.HandleHireModal));
                        } else {
                            swal(`D??? li???u ???????c gi??? nguy??n!`);
                            // this.HandleHireModal();
                            this.setState({
                                item: this.props.item
                            });
                        }
                    });
                } else {
                    swal({
                        title: "???? t???n t???i!",
                        text: "Vui l??ng ki???m tra l???i Email!!",
                        icon: "warning",
                    });
                }
            } else {
                swal({
                    title: "B???n Ch???c Ch????",
                    text: `N???u ?????ng ?? d??? li???u s??? thay ?????i!`,
                    icon: "info",
                    buttons: true,
                }).then((willDelete) => {
                    if (willDelete) {
                        swal(`D??? li???u ???? ???????c c???p nh???t!`, {
                            icon: "success",
                        });
                        this.props.dispatch(capNhatManager(admin_ID, itemAdd, this.HandleHireModal));
                    } else {
                        swal(`D??? li???u ???????c gi??? nguy??n!`);
                        // this.HandleHireModal();
                        this.setState({
                            item: this.props.item
                        });
                    }
                });
            }

        }

    }
    _setValue = () => {
        this.setState({
            item: this.props.item,
            oldItem: { ...this.state.oldItem, admin_USERNAME: this.props.item.admin_EMAIL.slice(0, this.props.item.admin_EMAIL.lastIndexOf('@')) }
        })
    }
    render() {
        // console.log(this.props.role === 1 ? 'th??m' : (this.props.role === 2 ? 'xem' : 's???a'));
        const {
            admin_ID, admin_PASSWORD, admin_CMNDMATSAU, admin_CMNDNOICAP,
            admin_CMNDMATTRUOC, admin_CMNDNGAYCAP, admin_TINHTRANG, admin_HOTEN,
            admin_AVATAR, admin_CHUCVU, admin_EMAIL, admin_NGAYSINH, admin_GIOITINH,
            admin_SDT, admin_DIACHI, admin_USERNAME, admin_CMND
        } = this.state.item;
        return (
            <StyledModel>
                <div className="modalService-dialog modal-lg">
                    <div className="modalService-content">
                        <div className="modalService-header " style={{ paddingBottom: 0 }}>
                            <h4 className="modal-title">{this.props.role === 1 ? "Th??m m???t qu???n tr??? vi??n m???i" : (this.props.role === 2 ? 'Th??ng tin qu???n tr??? vi??n' : 'C???p nh???t th??ng tin')}</h4>
                            <button type="button" className="close" onClick={this.HandleHireModal}>??</button>
                        </div>
                        <form className="modalService-body" style={{ paddingTop: 0 }} onSubmit={this.handleSubmit}>
                            <div className="titleGroup">Th??ng Tin C?? Nh??n</div>
                            <div className="d-flex justify-content-between mb-4">
                                <div className=" secondFormright" style={{ width: '65%', marginLeft: '1em' }}>
                                    <div className="d-flex justify-content-between">
                                        <div
                                            className={this.props.role === 2 ? 'form-group secondFormleft ac' : 'form-group secondFormleft'}
                                        >
                                            <label >H??? T??n</label>
                                            <input type="text" className="form-contro" value={admin_HOTEN ? admin_HOTEN : ''}
                                                name='admin_HOTEN'
                                                onChange={this.handleChange}
                                                disabled={this.props.role === 1 ? false : (this.props.role === 2 ? true : false)}
                                                required={true}
                                            />
                                        </div>
                                        <div
                                            className={this.props.role === 2 ? 'form-group secondFormright ac' : 'form-group secondFormright'}
                                        >
                                            <label >S??? ??i???n Tho???i</label>
                                            <input type="text" className="form-contro"
                                                value={admin_SDT ? admin_SDT : ''}
                                                name='admin_SDT'
                                                onChange={this.handleChangeSDT}
                                                disabled={this.props.role === 1 ? false : (this.props.role === 2 ? true : false)}
                                                required={true}
                                            />
                                        </div>
                                    </div>

                                    <div className="d-flex justify-content-between">
                                        <div
                                            className={this.props.role === 2 ? 'form-group secondFormleft ac' : 'form-group secondFormleft'}
                                        >
                                            <label >Ng??y Sinh</label>
                                            <input type="date" className="form-contro"
                                                value={admin_NGAYSINH ? admin_NGAYSINH : ''}
                                                name='admin_NGAYSINH'
                                                onChange={this.handleChange}
                                                disabled={this.props.role === 1 ? false : (this.props.role === 2 ? true : false)}
                                                required={true}
                                            />
                                        </div>
                                        <div
                                            className={this.props.role === 2 ? 'form-group secondFormright ac' : 'form-group secondFormright'}
                                        >
                                            <label>Gi???i T??nh: </label>
                                            <div className="form-contro d-flex justify-content-end">
                                                <p className="mr-2">
                                                    <input className="radGen" type="radio"

                                                        checked={admin_GIOITINH === 'Nam' ? true : false}
                                                        value='Nam'
                                                        name='admin_GIOITINH'
                                                        onChange={this.handleChange}
                                                        disabled={this.props.role === 1 ? false : (this.props.role === 2 ? true : false)}

                                                    />Nam
                                                </p>
                                                <p className="mx-4"></p>
                                                <p>
                                                    <input className="radGen" type="radio"
                                                        checked={admin_GIOITINH === 'Nam' ? false : true}
                                                        value="N???"
                                                        name='admin_GIOITINH'
                                                        onChange={this.handleChange}
                                                        disabled={this.props.role === 1 ? false : (this.props.role === 2 ? true : false)}
                                                    />N???
                                                 </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="d-flex justify-content-between">
                                        <div
                                            className={this.props.role === 2 ? 'form-group secondFormleft width3 ac' : 'form-group secondFormleft width3'}
                                            style={{ display: this.props.role === 1 ? 'none' : 'block' }}
                                        >
                                            <label>Ch???c v???: </label>
                                            <select className="form-contro"
                                                value={admin_CHUCVU ? admin_CHUCVU : ''}
                                                name='admin_CHUCVU'
                                                onChange={this.handleChange_Number}
                                                disabled={this.props.role === 1 ? false : (this.props.role === 2 ? true : false)}
                                            >
                                                <option value={0}>Admin</option>
                                                <option value={1}>Manager</option>
                                            </select>
                                        </div>
                                        <div
                                            className={this.props.role === 2 ? 'form-group secondFormright ac' : 'form-group secondFormright'}
                                        >
                                            <label >?????a Ch???</label>
                                            <input type="text" className="form-contro"
                                                value={admin_DIACHI ? admin_DIACHI : ''}
                                                name='admin_DIACHI'
                                                onChange={this.handleChange}
                                                disabled={this.props.role === 1 ? false : (this.props.role === 2 ? true : false)}
                                                required={true}
                                            />
                                        </div>
                                    </div>
                                    <div className="d-flex justify-content-between">
                                        <div
                                            className={this.props.role === 2 ? 'form-group secondFormleft ac' : 'form-group secondFormleft'}
                                        >
                                            <label >Email</label>
                                            <input type="text" className="form-contro"
                                                value={admin_EMAIL ? admin_EMAIL : ''}
                                                name='admin_EMAIL'
                                                onChange={this.handleChangeEmail}
                                                disabled={this.props.role === 1 ? false : (this.props.role === 2 ? true : false)}
                                                required={true}
                                            />
                                        </div>
                                        <div
                                            className={this.props.role === 2 ? 'form-group secondFormright width3 ac' : 'form-group secondFormright width3'}
                                            style={{ display: this.props.role === 1 ? 'none' : 'block' }}
                                        >
                                            <label>Tr???ng th??i: </label>
                                            <select className="form-contro"
                                                value={admin_TINHTRANG ? admin_TINHTRANG : ''}
                                                name='admin_TINHTRANG'
                                                onChange={this.handleChange_Number}
                                                disabled={this.props.role === 1 ? false : (this.props.role === 2 ? true : false)}
                                            >
                                                <option value={1}>??ang l??m</option>
                                                <option value={2}>Ngh??? vi???c</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div className=" secondFormleft d-flex justify-content-center" style={{ width: '35%', marginRight: '1em' }}>
                                    <div className="avatarImg">
                                        <img src={avatarImg} alt="" className="img-fluid" />
                                    </div>
                                </div>

                            </div>

                            <div className="pt-2" style={{ borderTop: '1px dotted #CBD1D9' }}>
                                <div className="d-flex justify-content-between">
                                    <div className=" secondFormright" style={{ width: '65%', alignSelf: 'flex-start', marginRight: '1em' }}>
                                        <div className="titleGroup">Ch???ng Minh Nh??n D??n</div>
                                        <div className="d-flex justify-content-between">
                                            <div
                                                className={this.props.role === 2 ? 'form-group secondFormleft ac' : 'form-group secondFormleft'}
                                            >
                                                <label >S??? CMND</label>
                                                <input type="text" className="form-contro"
                                                    value={admin_CMND ? admin_CMND : ''}
                                                    name='admin_CMND'
                                                    onChange={this.handleChangeCMND}
                                                    disabled={this.props.role === 1 ? false : (this.props.role === 2 ? true : false)}
                                                    required={true}
                                                />
                                            </div>
                                            <div
                                                className={this.props.role === 2 ? 'form-group secondFormright width3 ac' : 'form-group secondFormright width3'}
                                            >
                                                <label >Ng??y C???p</label>
                                                <input type="date" className="form-contro"
                                                    value={admin_CMNDNGAYCAP ? admin_CMNDNGAYCAP : ''}
                                                    name='admin_CMNDNGAYCAP'
                                                    onChange={this.handleChange}
                                                    disabled={this.props.role === 1 ? false : (this.props.role === 2 ? true : false)}
                                                    required={true}

                                                />
                                            </div>

                                        </div>
                                        <div
                                            className={this.props.role === 2 ? 'form-group ac' : 'form-group'}
                                        >
                                            <label >N??i c???p</label>
                                            <input type="text" className="form-contro"
                                                value={admin_CMNDNOICAP ? admin_CMNDNOICAP : ''}
                                                name='admin_CMNDNOICAP'
                                                onChange={this.handleChange}
                                                disabled={this.props.role === 1 ? false : (this.props.role === 2 ? true : false)}
                                                required={true}
                                            />
                                        </div>

                                    </div>

                                    <div className=" secondFormleft" style={{ width: '35%', marginLeft: '1em' }}>

                                        <div className={this.props.role === 2 ? 'form-group ac' : 'form-group'}>
                                            <label >???nh CMND M???t Tr?????c: </label>
                                            <div className="avatarImg cmnd">
                                                <img src={CMNDImg} alt="CMNDImg" className="img-fluid" />
                                            </div>
                                        </div>
                                        <div className={this.props.role === 2 ? 'form-group ac' : 'form-group'}>
                                            <label >???nh CMND M???t Sau: </label>
                                            <div className="avatarImg cmnd">
                                                <img src={CMNDImg} alt="CMNDImg" className="img-fluid" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div className="text-center" style={{ display: this.props.role === 1 ? "block" : (this.props.role === 2 ? 'none' : 'block') }}>
                                <button type="submit" className="btn btnAccept">X??c nh???n</button>
                            </div>

                        </form>


                    </div>

                </div>
            </StyledModel>
        );
    }
    componentDidMount() {
        this._setValue();
    }
}
const mapStateToProps = state => ({
    item: state.qlManager.modalManager.value,
    role: state.qlManager.modalManager.role,
    isExistEmail: state.qlManager.checkExistEmail,
    isExistSDT: state.qlManager.checkExistSDT,
    isExistCMND: state.qlManager.checkExistCMND,
})
export default connect(mapStateToProps)(ModalManager);