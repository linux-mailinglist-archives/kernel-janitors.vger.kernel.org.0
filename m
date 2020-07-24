Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91EBB22CA9D
	for <lists+kernel-janitors@lfdr.de>; Fri, 24 Jul 2020 18:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbgGXQLn (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 24 Jul 2020 12:11:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbgGXQLm (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 24 Jul 2020 12:11:42 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6253C0619D3;
        Fri, 24 Jul 2020 09:11:41 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id h28so7415422edz.0;
        Fri, 24 Jul 2020 09:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EnLeEgl0OdbAaR19fupjakxQIYn8oNSSFUXoArUSDD4=;
        b=PN8HgtabTcx8Yv5Vl7TKKt8ilN+h6fZzRO8BOYeie6UsHnNMPhGtI6jI2RZcV332fl
         ZwiZ4RRPewvKjCzpoTM63CA49uSI+cZrPk+LLB2OyZEO/gtUY7epFvlzFr1YzaluKOIg
         oUM1IeP+ghat581Gv1LxCh/njLteaWIDy7NqGIk7D2c3R+tzYbLvWwH6Q84InQt+FZKM
         k+CXuquSda3r1i1u99perBQNK643NhYKIITvKcdIlEb/KcI+hDYsxSSd+IzQYgfrbxAZ
         dcYOq9CQ8IR6op3m2IIzMD58qVKtEEodAF37nk2ZFESkbrnTugnAP/JdvHE6PS/1wfjr
         TYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EnLeEgl0OdbAaR19fupjakxQIYn8oNSSFUXoArUSDD4=;
        b=hzf+2B8qVLiTx44umtIde4k3imbMEiiHcCmj5pPEzbqwSNOVuDpFLywZeJO+WrKp8J
         17qVXXCEy1pw9hsQFf1IIUWF/aqK6a6pZPWb4guV9nU8m/fvMEH4SjeMzC5yW5lXLl8k
         DwKWFyX7V9HrizmRp/yxz7BOWpvoaqtm7tf6OahQ9ceUhrQ8g4mAnBNrle/VMTvKkNJC
         tlkebNsCZK+c9StmRP1D9ZUWalH69/vGSXc9V4hSEMqXg7/90IaxnbmY9Xee5skOPdTK
         WhVkBl2dXeDqfg54hJQcg0dpY9JMRpHh0BMba/pG5VCj9bCY1nl/KnpTv/QmwkKJCyR9
         eZ3Q==
X-Gm-Message-State: AOAM530a0UJiagiIaIvrEIkN0n9XESgapsd+j0RMz1WpycbJBDs3lCAa
        XmW0yEo2s3R3q8B3SilXbMk=
X-Google-Smtp-Source: ABdhPJyJKkO0tTDk55i9eurpxdEQmbiMx2WkErvdPGFCYKFBhnRmu/IH4uJxFSFeQppvydJQAndGgg==
X-Received: by 2002:aa7:da90:: with SMTP id q16mr9339146eds.44.1595607100348;
        Fri, 24 Jul 2020 09:11:40 -0700 (PDT)
Received: from garrit-VirtualBox.fritz.box ([94.31.102.44])
        by smtp.gmail.com with ESMTPSA id yj16sm971148ejb.122.2020.07.24.09.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 09:11:39 -0700 (PDT)
From:   garritfra <garritfranke@gmail.com>
To:     robert.moore@intel.com, rafael.j.wysocki@intel.com,
        lenb@kernel.org, trivial@kernel.org, linux-acpi@vger.kernel.org,
        devel@acpica.org, kernel-janitors@vger.kernel.org
Cc:     garritfra <garritfranke@gmail.com>
Subject: [PATCH v2] trivial: acpi: replace some bitshifts with BIT macro
Date:   Fri, 24 Jul 2020 18:11:12 +0200
Message-Id: <20200724161111.17531-1-garritfranke@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.21.2007241806070.2834@hadrien>
References: <alpine.DEB.2.21.2007241806070.2834@hadrien>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Signed-off-by: Garrit Franke <garritfranke@gmail.com>
---
 drivers/acpi/acpica/exfldio.c   | 2 +-
 drivers/acpi/acpica/utownerid.c | 6 +++---
 drivers/acpi/bus.c              | 2 +-
 drivers/acpi/sleep.c            | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/acpi/acpica/exfldio.c b/drivers/acpi/acpica/exfldio.c
index ade35ff1c7..92fc702456 100644
--- a/drivers/acpi/acpica/exfldio.c
+++ b/drivers/acpi/acpica/exfldio.c
@@ -298,7 +298,7 @@ acpi_ex_register_overflow(union acpi_operand_object *obj_desc, u64 value)
 		return (FALSE);
 	}
 
-	if (value >= ((u64) 1 << obj_desc->common_field.bit_length)) {
+	if (value >= ((u64) BIT(obj_desc->common_field.bit_length))) {
 		/*
 		 * The Value is larger than the maximum value that can fit into
 		 * the register.
diff --git a/drivers/acpi/acpica/utownerid.c b/drivers/acpi/acpica/utownerid.c
index d3525ef8ed..c4e2db2f54 100644
--- a/drivers/acpi/acpica/utownerid.c
+++ b/drivers/acpi/acpica/utownerid.c
@@ -74,13 +74,13 @@ acpi_status acpi_ut_allocate_owner_id(acpi_owner_id *owner_id)
 			 * int. Some compilers or runtime error detection may flag this as
 			 * an error.
 			 */
-			if (!(acpi_gbl_owner_id_mask[j] & ((u32)1 << k))) {
+			if (!(acpi_gbl_owner_id_mask[j] & (u32)BIT(k))) {
 				/*
 				 * Found a free ID. The actual ID is the bit index plus one,
 				 * making zero an invalid Owner ID. Save this as the last ID
 				 * allocated and update the global ID mask.
 				 */
-				acpi_gbl_owner_id_mask[j] |= ((u32)1 << k);
+				acpi_gbl_owner_id_mask[j] |= (u32)BIT(k);
 
 				acpi_gbl_last_owner_id_index = (u8)j;
 				acpi_gbl_next_owner_id_offset = (u8)(k + 1);
@@ -171,7 +171,7 @@ void acpi_ut_release_owner_id(acpi_owner_id *owner_id_ptr)
 	/* Decode ID to index/offset pair */
 
 	index = ACPI_DIV_32(owner_id);
-	bit = (u32)1 << ACPI_MOD_32(owner_id);
+	bit = (u32)BIT(ACPI_MOD_32(owner_id));
 
 	/* Free the owner ID only if it is valid */
 
diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 54002670cb..39ead80c45 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -233,7 +233,7 @@ acpi_status acpi_run_osc(acpi_handle handle, struct acpi_osc_context *context)
 		goto out_kfree;
 	}
 	/* Need to ignore the bit0 in result code */
-	errors = *((u32 *)out_obj->buffer.pointer) & ~(1 << 0);
+	errors = *((u32 *)out_obj->buffer.pointer) & BIT(0);
 	if (errors) {
 		if (errors & OSC_REQUEST_ERROR)
 			acpi_print_osc_error(handle, context,
diff --git a/drivers/acpi/sleep.c b/drivers/acpi/sleep.c
index aff13bf4d9..38f5210313 100644
--- a/drivers/acpi/sleep.c
+++ b/drivers/acpi/sleep.c
@@ -880,7 +880,7 @@ static void acpi_sleep_run_lps0_dsm(unsigned int func)
 {
 	union acpi_object *out_obj;
 
-	if (!(lps0_dsm_func_mask & (1 << func)))
+	if (!(lps0_dsm_func_mask & BIT(func)))
 		return;
 
 	out_obj = acpi_evaluate_dsm(lps0_device_handle, &lps0_dsm_guid, 1, func, NULL);
-- 
2.25.1

