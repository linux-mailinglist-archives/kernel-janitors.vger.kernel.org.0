Return-Path: <kernel-janitors+bounces-262-lists+kernel-janitors=lfdr.de@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EF77EA330
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 19:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6ED0B209A8
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Nov 2023 18:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC9E22F12;
	Mon, 13 Nov 2023 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nJ4FH4NK"
X-Original-To: kernel-janitors@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3730B22EEF
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Nov 2023 18:59:09 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA2FF3;
	Mon, 13 Nov 2023 10:59:07 -0800 (PST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ADHipp6019571;
	Mon, 13 Nov 2023 18:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-03-30;
 bh=zzMNjX3BrfWHKIRbDY1jN8f3ILT5tuXU2IMqzvh17gw=;
 b=nJ4FH4NKn26x7AakDb3+gXSyACChaO8bzk5CsAmX+TAtKY8MfaB/guJ+xKc+zuksIWE/
 r8A+AFvWZYUxemCPc3sI8JjcSmOwsjA4px1O5eoKNG7PB5DQw8Uql77vzwFG6Wg6A1WD
 5n2t8DRVKZTGjdKSK16DC5j59x48hLl5f8QtMRKuhEc90RIp2UUCavN6MBFezhEgFRUP
 mzgWqXRnuEAfuZNIiie97tgNtEz/p4m4Xs+NnAtnagOUU0pMbWIQIwHl9gbFyqrCxark
 CexBPcIq+Dq9KjEweMTZ5xZjLe4rdmNKoR65lFHWxdCjiUKGTgax6C1/+E9MrN5N+TNj 7A== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ua2m2bh23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Nov 2023 18:58:58 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3ADIVaiH014944;
	Mon, 13 Nov 2023 18:58:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3uaxpuuqxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Nov 2023 18:58:57 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3ADIwtmP021868;
	Mon, 13 Nov 2023 18:58:57 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3uaxpuuqw1-2;
	Mon, 13 Nov 2023 18:58:57 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, vegard.nossum@oracle.com,
        harshit.m.mogalapalli@oracle.com, darren.kenny@oracle.com
Subject: [PATCH v3 2/4] platform/x86: hp-bioscfg: move mutex_lock() down in hp_add_other_attributes()
Date: Mon, 13 Nov 2023 10:58:48 -0800
Message-ID: <20231113185852.3579970-2-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113185852.3579970-1-harshit.m.mogalapalli@oracle.com>
References: <20231113185852.3579970-1-harshit.m.mogalapalli@oracle.com>
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
 definitions=2023-11-13_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311130153
X-Proofpoint-GUID: ZcJ0bag_RAv6qD8zUnSAz9_Lbi0RDcMG
X-Proofpoint-ORIG-GUID: ZcJ0bag_RAv6qD8zUnSAz9_Lbi0RDcMG

attr_name_kobj's memory allocation is done with mutex_lock() held, this
is not needed.

Move allocation outside of mutex_lock() so unlock is not needed when
allocation fails.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 10676e1abc28..a3599498c4e8 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -575,79 +575,77 @@ static void release_attributes_data(void)
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
 	union acpi_object *obj = NULL;
 	int ret;
 	char *attr_name;
 
-	mutex_lock(&bioscfg_drv.mutex);
-
 	attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
-	if (!attr_name_kobj) {
-		ret = -ENOMEM;
-		goto err_other_attr_init;
-	}
+	if (!attr_name_kobj)
+		return -ENOMEM;
+
+	mutex_lock(&bioscfg_drv.mutex);
 
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
 		goto err_other_attr_init;
 	}
 
 	ret = kobject_init_and_add(attr_name_kobj, &attr_name_ktype,
 				   NULL, "%s", attr_name);
 	if (ret) {
 		pr_err("Error encountered [%d]\n", ret);
 		kobject_put(attr_name_kobj);
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
 	mutex_unlock(&bioscfg_drv.mutex);
 	kfree(obj);
 	return ret;
 }
-- 
2.39.3


