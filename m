Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C399F13A0F0
	for <lists+kernel-janitors@lfdr.de>; Tue, 14 Jan 2020 07:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbgANG2G (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 14 Jan 2020 01:28:06 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:33586 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbgANG2G (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 14 Jan 2020 01:28:06 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00E6CqNf155464;
        Tue, 14 Jan 2020 06:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=ijVvX1LBGkU8DKZf2ppAjFNoLLWhoyJ9NRaVj56nfZM=;
 b=c1jEvYYIQaknEAMyidXERRN7w6elH6HMD8pthAWu55o4zWU9wk+SbAHKxj5ZRma9FiJw
 xEuZY5Jpywx2KqbhLFBslzi2V/sNrisGH+XW8UEHK4nok9NFWWiRDFELj6w6sbn5dN9/
 AjJ2Wky/XkXDcb602CAbxdx4RL9Thh/NXY5nwb8/Fhb1RK5MiA5DG0k7hhhWsRNANqc4
 LmN+LRbgYAt6l+o8s/6usimcGPBbY4gI0psc4c/3crJ5Vro8qm8qzLDfUGiGSUGbS5hF
 oWduVriXwXZ51SopbMHV36R5vnfSR1+LnYHchzvMgJ/KrOiZJN3Mwoara8uQ3VL5iQkl 1w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 2xf74s3u4j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jan 2020 06:28:04 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00E6EDlc176513;
        Tue, 14 Jan 2020 06:28:03 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 2xfrgk1ked-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jan 2020 06:28:03 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00E6S2Wv024511;
        Tue, 14 Jan 2020 06:28:02 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 13 Jan 2020 22:28:01 -0800
Date:   Tue, 14 Jan 2020 09:27:56 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     robh@kernel.org
Cc:     kernel-janitors@vger.kernel.org
Subject: [bug report] scripts/dtc: Update to upstream version
 v1.5.0-23-g87963ee20693
Message-ID: <20200114062756.rrjqh3pdguensgyq@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9499 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=860
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001140055
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9499 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=911 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001140055
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Rob Herring,

The patch 9bb9c6a110ea: "scripts/dtc: Update to upstream version
v1.5.0-23-g87963ee20693" from Jun 12, 2019, leads to the following
static checker warning:

	lib/../scripts/dtc/libfdt/fdt_addresses.c:76 fdt_appendprop_addrrange()
	warn: integer overflow (literal): u32max + 1

lib/../scripts/dtc/libfdt/fdt_addresses.c
    57  int fdt_appendprop_addrrange(void *fdt, int parent, int nodeoffset,
    58                               const char *name, uint64_t addr, uint64_t size)
    59  {
    60          int addr_cells, size_cells, ret;
    61          uint8_t data[sizeof(fdt64_t) * 2], *prop;
    62  
    63          ret = fdt_address_cells(fdt, parent);
    64          if (ret < 0)
    65                  return ret;
    66          addr_cells = ret;
    67  
    68          ret = fdt_size_cells(fdt, parent);
    69          if (ret < 0)
    70                  return ret;
    71          size_cells = ret;
    72  
    73          /* check validity of address */
    74          prop = data;
    75          if (addr_cells == 1) {
    76                  if ((addr > UINT32_MAX) || ((UINT32_MAX + 1 - addr) < size))
                                                     ^^^^^^^^^^^^^^
UINT32_MAX + 1 is zero.

    77                          return -FDT_ERR_BADVALUE;
    78  
    79                  fdt32_st(prop, (uint32_t)addr);
    80          } else if (addr_cells == 2) {
    81                  fdt64_st(prop, addr);
    82          } else {
    83                  return -FDT_ERR_BADNCELLS;
    84          }
    85  
    86          /* check validity of size */
    87          prop += addr_cells * sizeof(fdt32_t);
    88          if (size_cells == 1) {

regards,
dan carpenter
