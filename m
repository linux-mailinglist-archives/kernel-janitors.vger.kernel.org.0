Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9954C143635
	for <lists+kernel-janitors@lfdr.de>; Tue, 21 Jan 2020 05:34:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728042AbgAUEeO (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 20 Jan 2020 23:34:14 -0500
Received: from mail-io1-f48.google.com ([209.85.166.48]:36519 "EHLO
        mail-io1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727144AbgAUEeO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 20 Jan 2020 23:34:14 -0500
Received: by mail-io1-f48.google.com with SMTP id d15so1434888iog.3
        for <kernel-janitors@vger.kernel.org>; Mon, 20 Jan 2020 20:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ucsb.edu; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=Xdea3HQSp53Oz71mh+IvjNxcoof0q87BXUiQZ0dui64=;
        b=iTAHCzap/d0ur0NqYVleTCfORSqdb7KgN8TL9hUPePr/Len22vX31+iP0mYPT968C+
         qy7Tj8pyG/3kjkfFgZW9EFscNSpACKIaTuCgqQdy/WU01Yr+Z5dcp3+g0FGIg+MuE/OF
         EWnIDTDMt0qNCfEPsVFlJFfzvlkCKqkNEaJyUfzNFIA7sz8hZeZiiPrGuEWs7x3jTLVM
         1W9dH0Iogd5FJ8sbUrc2llw0WgfUbTANQN6sf/ZrUIpY7UgO9m4DKKu1aWrcBDwKpJY9
         wBppLS4XmUaQEbv/kSrgn6RsKDCizOIqnOLuOhA805F+eVNeXc/+xpS8gfMD1hMSV3Yy
         hqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Xdea3HQSp53Oz71mh+IvjNxcoof0q87BXUiQZ0dui64=;
        b=lubqneSL8C3pVswxEBOlkIgQM5O7gId7qtb1nlhhrS0RduwqBKe1FSrnVUkM/6TQjK
         iZQuNhVeFNLfhpW35OMFjqYx6GLfMa6XmQX9pIhXhDk9eZCMZVwp4yh8wcIyKAciibbV
         0kH0l9KqM/psaoPFcPGZvqJIe2WTgZsv/b9pT+e4zBV5Q37RhSASqn+hY7i4t3HKtDpF
         fIEsphdugGlAR62wmfzKzTR2jskhJe9N6wI0K6jPxZjXEK0qYldKK6hjGzb2jKXM7dw/
         hFD6k0phdEIC7RBMZXRQlG8xsjg9NBhPpPYPvap6O6r5b3kF7IPtVzzsicy5T7U/Y96u
         hBog==
X-Gm-Message-State: APjAAAVsYQ6sxChWgcYBNZLXw6QzMQqD7thvF1ay3PABreCJ+fF6w1ps
        k4StenFAj26fPdsEOg4xzm2zCWow5RUg3azHsDrjBay1ecE=
X-Google-Smtp-Source: APXvYqzpgW98RUEVFzN0OLw//f1OHJL0uSZIqOaL2s0yrzfWg6mDM3s5n4lz7yhZezDCzfvahEOgA0Ds0ysMTaj1qSs=
X-Received: by 2002:a6b:7846:: with SMTP id h6mr1806128iop.224.1579581253206;
 Mon, 20 Jan 2020 20:34:13 -0800 (PST)
MIME-Version: 1.0
From:   Raymond Deng <raymonddeng@ucsb.edu>
Date:   Mon, 20 Jan 2020 20:34:02 -0800
Message-ID: <CAHM57JSf8XXOKzyjBWD3m7PPUaEC7Oa_XYyOjbcEfJj5Swxu7Q@mail.gmail.com>
Subject: Open tasks?
To:     kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi, are there open tasks for reasonably new people to do?
