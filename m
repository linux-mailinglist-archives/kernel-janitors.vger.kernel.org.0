Return-Path: <kernel-janitors+bounces-49-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B647DBCB2
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Oct 2023 16:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68A7FB20D9B
	for <lists+kernel-janitors@lfdr.de>; Mon, 30 Oct 2023 15:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B867118AF9;
	Mon, 30 Oct 2023 15:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nCd4Ksw9"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8569318AED
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 15:35:11 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8463CDA;
	Mon, 30 Oct 2023 08:35:10 -0700 (PDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39UDtnZ8013294;
	Mon, 30 Oct 2023 15:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-03-30;
 bh=CrbiaMaWf5Mwb3F8GLvHk/mLZs9QCeYbPx7aBZB52co=;
 b=nCd4Ksw9p219e6K2BEfjgfXWxOuX5xXJmlmkHKVRY+0RahDwO6gxYoK6SCV0/TAKZoEw
 5dAUDtnqevdaG1unYuRcDNUbq+al/y3VUXV0GKVA+YifRfpR/i1le61Ogbu3X3CCEm3o
 X1IWjwC0x8cC9a4U2h7qu1WkOU+pIBRUQUUzUfsKocHeDHilaD6pepNrov7xy4rRKnrc
 ingp95v9Uyy1BlcVw5tEk4DRWvveiHF3LQet/g2uvANBDVxxL5Vc1FXnRYMkwYwkSx9b
 2EJQiwzblmQZ5p594VzlLVy30DAiP5HpPI45k0Vm1q+LGrb0ZBYQ18eR/OAqRmU03U6O ug== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3u0tbdk0pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Oct 2023 15:35:02 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39UE42lO038142;
	Mon, 30 Oct 2023 15:35:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3u0rran8yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Oct 2023 15:35:01 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39UFVkmM023458;
	Mon, 30 Oct 2023 15:35:01 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3u0rran8wc-7;
	Mon, 30 Oct 2023 15:35:01 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: dan.carpenter@linaro.org, kartilak@cisco.com, sebaddel@cisco.com,
        jejb@linux.ibm.com, Su Hui <suhui@nfschina.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] scsi: snici: remove useless code in snic_dr_clean_pending_req
Date: Mon, 30 Oct 2023 11:34:51 -0400
Message-Id: <169868005491.2933713.3223961175436609019.b4-ty@oracle.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231020023326.43898-1-suhui@nfschina.com>
References: <20231020023326.43898-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_10,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 adultscore=0 mlxlogscore=548 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310300120
X-Proofpoint-GUID: UtWRX96p_dAV9WPNRqqibqWpHZ2fdUxC
X-Proofpoint-ORIG-GUID: UtWRX96p_dAV9WPNRqqibqWpHZ2fdUxC

On Fri, 20 Oct 2023 10:33:27 +0800, Su Hui wrote:

> return error code directly to save space and be more clear.
> 
> 

Applied to 6.7/scsi-queue, thanks!

[1/1] scsi: snici: remove useless code in snic_dr_clean_pending_req
      https://git.kernel.org/mkp/scsi/c/44a31659ea60

-- 
Martin K. Petersen	Oracle Linux Engineering

