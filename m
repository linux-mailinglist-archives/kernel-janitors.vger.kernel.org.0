Return-Path: <kernel-janitors+bounces-275-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C62F57EA45C
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 21:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 62681B20AB0
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 20:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A248E24207;
	Mon, 13 Nov 2023 20:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LJdy6XDI"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6114522EEB
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 20:08:33 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591A1D73;
	Mon, 13 Nov 2023 12:08:32 -0800 (PST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ADHiQqF005408;
	Mon, 13 Nov 2023 20:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-03-30;
 bh=XDtSBsTn2b+kLXz7T7QRWj63RVMlaoXCIevLvCLxJ70=;
 b=LJdy6XDIxi9TQ4h7uls8OEJ8nZkTlBTV0t8QxzSz0UWVUdzi+ePBs3mC2qgZbHgtK3tv
 Kee3+NCOD1hLXE73bNBY7qEz69/YXnJOv1sUFS4KpyYwJZCHteDSbysgEGqKi1M6DhYH
 2aR6c3vfNKAZ3PO1Ma42wXwlaQdd5QjIBfUIA4OcXzLacNRfZ6gpdPrdMFKLBys4qUzp
 ERtra5gwVg9+IGtD8zvtez9N9eRnF9Juvmes1wEBmcDHfnoi8Fy3J7or9OsewsT4vfNY
 3SLHdaHRHyyz33p+vPWFlLhP5uZg+34r8CaOzjr4LXvXxnxFCE58/+C0+t45jvMuJVqQ Wg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ua2n3bmf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Nov 2023 20:08:24 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3ADJBbRj029773;
	Mon, 13 Nov 2023 20:08:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3uaxqqe9h3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Nov 2023 20:08:22 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3ADK7jMb026381;
	Mon, 13 Nov 2023 20:08:19 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3uaxqqe8vg-4;
	Mon, 13 Nov 2023 20:08:19 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, vegard.nossum@oracle.com,
        harshit.m.mogalapalli@oracle.com
Subject: [PATCH v4 4/4] platform/x86: hp-bioscfg: Remove unused obj in hp_add_other_attributes()
Date: Mon, 13 Nov 2023 12:07:40 -0800
Message-ID: <20231113200742.3593548-4-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113200742.3593548-1-harshit.m.mogalapalli@oracle.com>
References: <20231113200742.3593548-1-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-13_11,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311130160
X-Proofpoint-GUID: tTpdJjZZ50TmSNtiiGd8B6eNI1NPnQc0
X-Proofpoint-ORIG-GUID: tTpdJjZZ50TmSNtiiGd8B6eNI1NPnQc0

acpi_object *obj is unused in this function, so delete it, also
delete a unnecessary kfree(obj);

Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 6ddca857cc4d..8c9f4f3227fc 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -575,80 +575,78 @@ static void release_attributes_data(void)
 /**
  * hp_add_other_attributes() - Initialize HP custom attributes not
  * reported by BIOS and required to support Secure Platform and Sure
  * Start.
  *
  * @attr_type: Custom HP attribute not reported by BIOS
  *
  * Initialize all 2 types of attributes: Platform and Sure Start
  * object.  Populates each attribute types respective properties
  * under sysfs files.
  *
  * Returns zero(0) if successful. Otherwise, a negative value.
  */
 static int hp_add_other_attributes(int attr_type)
 {
 	struct kobject *attr_name_kobj;
-	union acpi_object *obj = NULL;
 	int ret;
 	char *attr_name;
 
 	attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
 	if (!attr_name_kobj)
 		return -ENOMEM;
 
 	mutex_lock(&bioscfg_drv.mutex);
 
 	/* Check if attribute type is supported */
 	switch (attr_type) {
 	case HPWMI_SECURE_PLATFORM_TYPE:
 		attr_name_kobj->kset = bioscfg_drv.authentication_dir_kset;
 		attr_name = SPM_STR;
 		break;
 
 	case HPWMI_SURE_START_TYPE:
 		attr_name_kobj->kset = bioscfg_drv.main_dir_kset;
 		attr_name = SURE_START_STR;
 		break;
 
 	default:
 		pr_err("Error: Unknown attr_type: %d\n", attr_type);
 		ret = -EINVAL;
 		kfree(attr_name_kobj);
 		goto unlock_drv_mutex;
 	}
 
 	ret = kobject_init_and_add(attr_name_kobj, &attr_name_ktype,
 				   NULL, "%s", attr_name);
 	if (ret) {
 		pr_err("Error encountered [%d]\n", ret);
 		goto err_other_attr_init;
 	}
 
 	/* Populate attribute data */
 	switch (attr_type) {
 	case HPWMI_SECURE_PLATFORM_TYPE:
 		ret = hp_populate_secure_platform_data(attr_name_kobj);
 		break;
 
 	case HPWMI_SURE_START_TYPE:
 		ret = hp_populate_sure_start_data(attr_name_kobj);
 		break;
 
 	default:
 		ret = -EINVAL;
 	}
 
 	if (ret)
 		goto err_other_attr_init;
 
 	mutex_unlock(&bioscfg_drv.mutex);
 	return 0;
 
 err_other_attr_init:
 	kobject_put(attr_name_kobj);
 unlock_drv_mutex:
 	mutex_unlock(&bioscfg_drv.mutex);
-	kfree(obj);
 	return ret;
 }
 
-- 
2.42.0


