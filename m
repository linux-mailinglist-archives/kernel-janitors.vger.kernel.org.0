Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B98B66DD92
	for <lists+kernel-janitors@lfdr.de>; Tue, 17 Jan 2023 13:28:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236353AbjAQM2z (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 17 Jan 2023 07:28:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236209AbjAQM2y (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 17 Jan 2023 07:28:54 -0500
Received: from aib29gb127.yyz1.oracleemaildelivery.com (aib29gb127.yyz1.oracleemaildelivery.com [192.29.72.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 510DF35275
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Jan 2023 04:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-2023;
 d=n8pjl.ca;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=rSfuiJxxoteBB8nWQz9EHh3tEZgaUdP09an5J6pNf38=;
 b=Ca+6e6eX/idiXFhgWkZ7D0GoBiwBySUcpRLuBgaSSf7WCNoIf93HVFyXs2rXrg79akmrx5hPgob8
   J4uo/G9z70lIKk5w03AJgW07l33g8cWFegZV45zqKh8AJA6vLeehyyAH0Uub3H+mqGAchJfrFORj
   jvH6vwLB2iidIf4eX6Fm09DdmRio+ARWKJjgMLejuf64irGwF7DAK1FXf+VjRhBRtk04SRZMJFEV
   3dj0hLWm5riaQfl1Uzor68T1zmDpeywDettrbkd4aoxw+b4zU3NkHmV2xgiBDIwYntL3urpFM8g3
   qOxrqmdExFI7DxTLM7fgicBY0H24TUpXb2ZnvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-yyz-20200204;
 d=yyz1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=rSfuiJxxoteBB8nWQz9EHh3tEZgaUdP09an5J6pNf38=;
 b=GZ7CnAVcXO/xzZb3LyWQTCFbbkqTNrLrZDZ/I3fePfWqk9SmeL67E2Wft45I8EiwQKT6Lm1Ff/ya
   EEkL6sCWlADcqYXncfvwy+ZFFx4lGAt5Ev5JEek1D1HtwgIkLUD21Px2iE2YJpR/iZ5KhXEVdWnu
   sjKbSgLAKQLebjvwg1e0LK/1PqsUgcVqYgfx8bK/7DEJ/d4nt+yifZ1RwhBLZWTr6FmeFJGPLSfW
   KPiof34RG2EJDvf4LK8u6kNtUSbcxSiUGlqzwUJYyOR4xb6mL4JcZqhsG68Kwt6HwcUtJhr1Xmso
   ksUe1XT6TXTMM+xG4C/M0m6YUza3a+JIRiPMRg==
Received: by omta-ad1-fd3-102-ca-toronto-1.omtaad1.vcndpyyz.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20221212 64bit (built Dec 12
 2022))
 with ESMTPS id <0ROM00M7IQO383B0@omta-ad1-fd3-102-ca-toronto-1.omtaad1.vcndpyyz.oraclevcn.com> for
 kernel-janitors@vger.kernel.org; Tue, 17 Jan 2023 12:28:51 +0000 (GMT)
From:   Peter Lafreniere <peter@n8pjl.ca>
To:     kvalo@kernel.org
Cc:     linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, Peter Lafreniere <peter@n8pjl.ca>
Subject: Re: [PATCH] wifi: rsi: Avoid defines prefixed with CONFIG
Date:   Tue, 17 Jan 2023 07:28:38 -0500
Message-id: <20230117122838.5006-1-peter@n8pjl.ca>
X-Mailer: git-send-email 2.39.0
In-reply-to: <87mt6h8xu7.fsf@kernel.org>
References: <87mt6h8xu7.fsf@kernel.org>
MIME-version: 1.0
Content-transfer-encoding: 8bit
Reporting-Meta: AAFB26/OsDs3HpaqMgyiQ+gVr10Eu3gsJyXSTiaqp0dYs2WEvkjae9Bo+cOYXsN/
 U1yayjDbJGkvjRRxA5O4uC24CUPlfHp7L4+lxw0gTE6GQCNxBDFUDhyVxxy8+RmN
 Qk49MYo9meXPR9KSp5vSTa7QwxU2OQFrXAA08Hy9AKbV7922zBNqrJegZSFvMlwc
 xiXBiLU+U5OvNYk3AkVXE2ZbPraItMa8rB+GZ1Go0nfCmxF0enblaAkb5grHFUJV
 gUtnLYrvznSbHgudFTi+++ITNzHY1irkMXqLs9mrtXBePOp5OqtKbU+OgcXQVjYM
 8LShAe78PhauYoRlemfwK1PeYYhHFhezyx6Io5eejxwyK2RuaYFB/xgpcJxvxhle
 cUuSG60TtvWswGgWB0hWG0uIIRQrNhJ70z8LVTIaXCPu11NgxES7xGsm4xgUuhk=
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

That would work better, but to me it seems odd to have one define
with a prefix and the others without. I could change them all, but
that seems like excessive churn for the very minor 'issue' that
it fixes.

After rereadig rsi_load_9113_firmware(), it seems like just dropping
the CONFIG_ would be a reasonable change that doesn't affect readability.

Cheers,
Peter
