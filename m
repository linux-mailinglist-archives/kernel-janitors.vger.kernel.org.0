Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63E5D138C6D
	for <lists+kernel-janitors@lfdr.de>; Mon, 13 Jan 2020 08:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728760AbgAMHhR (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 13 Jan 2020 02:37:17 -0500
Received: from mail02.vodafone.es ([217.130.24.81]:63461 "EHLO
        mail02.vodafone.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728687AbgAMHhQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 13 Jan 2020 02:37:16 -0500
IronPort-SDR: YQAuI+dxN4x4fWMv7aYRtXPCXjJgmH5HWq5162oX+xhILzrBOGQcFlxQMv0tPIvtJ0bSsIOOg5
 GxGjft0rLKmw==
IronPort-PHdr: =?us-ascii?q?9a23=3ACljHMBLMVIW+hhy3QNmcpTZWNBhigK39O0sv0r?=
 =?us-ascii?q?FitYgfKvTxwZ3uMQTl6Ol3ixeRBMOHsqkC0bSH+Pm5ASQp2tWoiDg6aptCVh?=
 =?us-ascii?q?sI2409vjcLJ4q7M3D9N+PgdCcgHc5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFR?=
 =?us-ascii?q?rhKAF7Ovr6GpLIj8Swyuu+54Dfbx9HiTagb75+Ngu6oATVu8UZnIduN7o9wQ?=
 =?us-ascii?q?bVr3VVfOhb2XlmLk+JkRbm4cew8p9j8yBOtP8k6sVNT6b0cbkmQLJBFDgpPH?=
 =?us-ascii?q?w768PttRnYUAuA/WAcXXkMkhpJGAfK8hf3VYrsvyTgt+p93C6aPdDqTb0xRD?=
 =?us-ascii?q?+v4btnRAPuhSwaMTI193zZhdBqg6JeoBOtvgJyw4nOYIGNM/p+ZLnSfc8ESm?=
 =?us-ascii?q?ZYQMlRUTVND5+gb4sTFeUOIeZYoJf4p1QQqxu+GRCgC/3pyjNRgXH22qs63P?=
 =?us-ascii?q?ohEA3fwgMgGc8FvHDaodnpKKseVOa4x7TKwzredfNbwTnz5ojSch4/ov+CQL?=
 =?us-ascii?q?1/ftbex0Q0CwPIjEmfpZD5Mz+JyOgAtXWQ4ep6VeKojm4qsxt/rSazxsgykI?=
 =?us-ascii?q?nCm4IaylfC9SV23Y04IsW4R1BnYdG6CptRuSaaN415Qs45Q2Fooz01xaEctZ?=
 =?us-ascii?q?GneygKzY4rxx7ca/GedYWD/xHtVP6JLDtmmX5oeqiziwu8/ES80OHwSMa53E?=
 =?us-ascii?q?xEoydFlNTHq2oD2AbJ6sedT/tw5kKh2TGS2A/N8uxEOkU0lbbDK54m374wio?=
 =?us-ascii?q?IfsUTdES/yn0X7lKqWeV8l+uis8eTofLHmqoOTOoNulAH+NbkhldaxAeQ/NA?=
 =?us-ascii?q?gBQXKX9vqn1LH7/E35RqtFjuEun6XHrZzXJ94XqrO3DgNJyIov9RmyAy2o3d?=
 =?us-ascii?q?kYhXUHKUhKeBODj4jnIVHOJ/X4AO+ng1uyjDdk2erGP7PmApXLIXjOi7fhfa?=
 =?us-ascii?q?1m5EFA0gY80ddf55dOBrEBI/L/QlXxu8DADh8lLwy0xP7qCNZj2YMEX2KAHK?=
 =?us-ascii?q?uZPLrQsVCS4OIvIvWMZIgPuDbmMPUl+fHugmEjmVMHfqmmw4EXaHamEfRiOU?=
 =?us-ascii?q?mZZmDsgthSWVsN6wkzVurnjBiAWDhSe3GoRIoi6TwhToGrF4HOQsaqmrPS5i?=
 =?us-ascii?q?qjGoxqYTV+B0yBCz/XcIOLE6MUZT6fONBmlDMEVri6QYQJ2hSntQu8wL1ieL?=
 =?us-ascii?q?n64Cod4KruyNVvr9LUkx56oSR5E8mHzGaLQEl0hWkDATQx2eZ/ohoumR+4za?=
 =?us-ascii?q?FkjqkBRpRo7PRTX1JhbcbR?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HDKwADHRxeeiMYgtkUBjMYGwEBAQE?=
 =?us-ascii?q?BAQEFAQEBEQEBAwMBAQGBewIBARcBAYEjAgmBTVIgEpNQgU0fg0OLY4EAgx4?=
 =?us-ascii?q?VhggTDIFbDQEBAQEBGxoCAQGEQE4BF4ESJDoEDQIDDQEBBQEBAQEBBQQBAQI?=
 =?us-ascii?q?QAQEJDQsEK4VKgh0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKDEABDgFThU8BATO?=
 =?us-ascii?q?FJJc8AYQEiQANDQKFHYJFBAqBCYEaI4E0AgEBjBcagUE/gSMhgisIAYIBgn8?=
 =?us-ascii?q?BEgFsgkiCWQSNQhIhgQeIKZgXgkEEdolMjAKCNwEPiAGEMQMQgkUPgQmIA4R?=
 =?us-ascii?q?OgX2jN1eBDA16cTMagiYagSBPGA2WSECBFhACT4kugjIBAQ?=
X-IPAS-Result: =?us-ascii?q?A2HDKwADHRxeeiMYgtkUBjMYGwEBAQEBAQEFAQEBEQEBA?=
 =?us-ascii?q?wMBAQGBewIBARcBAYEjAgmBTVIgEpNQgU0fg0OLY4EAgx4VhggTDIFbDQEBA?=
 =?us-ascii?q?QEBGxoCAQGEQE4BF4ESJDoEDQIDDQEBBQEBAQEBBQQBAQIQAQEJDQsEK4VKg?=
 =?us-ascii?q?h0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKDEABDgFThU8BATOFJJc8AYQEiQAND?=
 =?us-ascii?q?QKFHYJFBAqBCYEaI4E0AgEBjBcagUE/gSMhgisIAYIBgn8BEgFsgkiCWQSNQ?=
 =?us-ascii?q?hIhgQeIKZgXgkEEdolMjAKCNwEPiAGEMQMQgkUPgQmIA4ROgX2jN1eBDA16c?=
 =?us-ascii?q?TMagiYagSBPGA2WSECBFhACT4kugjIBAQ?=
X-IronPort-AV: E=Sophos;i="5.69,428,1571695200"; 
   d="scan'208";a="323897012"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail02.vodafone.es with ESMTP; 13 Jan 2020 08:37:15 +0100
Received: (qmail 27882 invoked from network); 12 Jan 2020 04:18:43 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
          (envelope-sender <peterwong@hsbc.com.hk>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <kernel-janitors@vger.kernel.org>; 12 Jan 2020 04:18:43 -0000
Date:   Sun, 12 Jan 2020 05:18:43 +0100 (CET)
From:   Peter Wong <peterwong@hsbc.com.hk>
Reply-To: Peter Wong <peterwonghkhsbc@gmail.com>
To:     kernel-janitors@vger.kernel.org
Message-ID: <31665681.328893.1578802723614.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

